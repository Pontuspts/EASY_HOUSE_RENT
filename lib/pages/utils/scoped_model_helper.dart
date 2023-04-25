import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// It encapsulates the state of the FilterBar component and some methods to handle state changes.
//Encapsulate the data that needs to be shared into the Model. Used to filter data. Did not materialize.
class ScopedModelHelper {
  static T getModel<T extends Model>(BuildContext context) {
    return ScopedModel.of(context, rebuildOnChange: true);
  }
}
