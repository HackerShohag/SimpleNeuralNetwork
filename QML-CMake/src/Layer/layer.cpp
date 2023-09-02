/*
 * Copyright (C) 2023  Abdullah AL Shohag
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * raven.downloader is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "Layer"

Layer::Layer(int numNodesIn, int numNodesOut)
{
        this->numNodesIn = numNodesIn;
        this->numNodesOut = numNodesOut;
        weights = new double(numNodesIn + numNodesOut);
        biases = new double(numNodesOut);
}

double* Layer::CalculateOutputs(double inputs[])
{
    double* weightedInputs = new double[numNodesOut];
    for (int nodeOut = 0; nodeOut < numNodesOut; nodeOut++) {
        double weightedInput = biases[nodeOut];
        for (int nodeIn = 0; nodeIn < numNodesIn; nodeIn++) {
            weightedInput += inputs[nodeIn] * weights[nodeIn + nodeOut];
        }
        weightedInputs[nodeOut] = weightedInput;
    }
    return weightedInputs;
}