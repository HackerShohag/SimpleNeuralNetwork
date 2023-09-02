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

#include <algorithm>
#include <iterator>
#include "NeuralNetwork"

NeuralNetwork::NeuralNetwork(int layerSizes[]) {
    this->sizeOfLayers = sizeof(*layerSizes)/sizeof(int);

    for (int i = 0; i < sizeOfLayers; i ++) {
        layers[i] = new Layer(layerSizes[i], layerSizes[i + 1]);
    }
}

double* NeuralNetwork::CalculateOutputs(double inputs[])
{
    for (int i = 0; i < sizeOfLayers; i++) {
        inputs = layers[i]->CalculateOutputs(inputs);
    }
    return inputs;
}

int NeuralNetwork::Classify(double inputs[])
{
    double* outputs = CalculateOutputs(inputs);

    // returns the index of the maximum element
    return std::distance(outputs, std::max_element(outputs, outputs));
}
