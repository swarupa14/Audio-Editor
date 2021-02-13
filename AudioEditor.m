classdef AudioEditor < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        SelectAudioPanel             matlab.ui.container.Panel
        BrowseButton                 matlab.ui.control.Button
        FileEditFieldLabel           matlab.ui.control.Label
        FileEditField                matlab.ui.control.EditField
        TrimAudioPanel               matlab.ui.container.Panel
        secondsLabel                 matlab.ui.control.Label
        CliplengthEditFieldLabel     matlab.ui.control.Label
        CliplengthEditField          matlab.ui.control.NumericEditField
        StartEditFieldLabel          matlab.ui.control.Label
        StartEditField               matlab.ui.control.NumericEditField
        StopEditFieldLabel           matlab.ui.control.Label
        StopEditField                matlab.ui.control.NumericEditField
        ApplyButton_2                matlab.ui.control.Button
        VOLUMESliderLabel            matlab.ui.control.Label
        VOLUMESlider                 matlab.ui.control.Slider
        PLAYBACKSPEEDSliderLabel     matlab.ui.control.Label
        PLAYBACKSPEEDSlider          matlab.ui.control.Slider
        NOISEREDUCTIONDropDownLabel  matlab.ui.control.Label
        NOISEREDUCTIONDropDown       matlab.ui.control.DropDown
        ApplyButton                  matlab.ui.control.Button
        PITCHSliderLabel             matlab.ui.control.Label
        PITCHSlider                  matlab.ui.control.Slider
        PLAYButton                   matlab.ui.control.Button
        PAUSEButton                  matlab.ui.control.Button
        SAVEButton                   matlab.ui.control.Button
        RESETButton                  matlab.ui.control.Button
        COMPRESSSliderLabel          matlab.ui.control.Label
        COMPRESSSlider               matlab.ui.control.Slider
        STOPButton                   matlab.ui.control.Button
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 636 491];
            app.UIFigure.Name = 'MATLAB App';

            % Create SelectAudioPanel
            app.SelectAudioPanel = uipanel(app.UIFigure);
            app.SelectAudioPanel.Title = 'Select Audio';
            app.SelectAudioPanel.Position = [24 412 586 66];

            % Create BrowseButton
            app.BrowseButton = uibutton(app.SelectAudioPanel, 'push');
            app.BrowseButton.Tag = 'browsebutton';
            app.BrowseButton.Position = [465 13 100 22];
            app.BrowseButton.Text = 'Browse';

            % Create FileEditFieldLabel
            app.FileEditFieldLabel = uilabel(app.SelectAudioPanel);
            app.FileEditFieldLabel.Position = [44 13 25 22];
            app.FileEditFieldLabel.Text = 'File';

            % Create FileEditField
            app.FileEditField = uieditfield(app.SelectAudioPanel, 'text');
            app.FileEditField.Position = [84 13 355 22];

            % Create TrimAudioPanel
            app.TrimAudioPanel = uipanel(app.UIFigure);
            app.TrimAudioPanel.Title = 'Trim Audio';
            app.TrimAudioPanel.Position = [24 308 586 92];

            % Create secondsLabel
            app.secondsLabel = uilabel(app.TrimAudioPanel);
            app.secondsLabel.HorizontalAlignment = 'right';
            app.secondsLabel.Position = [335 47 50 22];
            app.secondsLabel.Text = 'seconds';

            % Create CliplengthEditFieldLabel
            app.CliplengthEditFieldLabel = uilabel(app.TrimAudioPanel);
            app.CliplengthEditFieldLabel.HorizontalAlignment = 'right';
            app.CliplengthEditFieldLabel.Position = [190 47 62 22];
            app.CliplengthEditFieldLabel.Text = 'Clip length';

            % Create CliplengthEditField
            app.CliplengthEditField = uieditfield(app.TrimAudioPanel, 'numeric');
            app.CliplengthEditField.HorizontalAlignment = 'center';
            app.CliplengthEditField.Position = [267 47 67 22];

            % Create StartEditFieldLabel
            app.StartEditFieldLabel = uilabel(app.TrimAudioPanel);
            app.StartEditFieldLabel.HorizontalAlignment = 'center';
            app.StartEditFieldLabel.Position = [139 10 44 22];
            app.StartEditFieldLabel.Text = 'Start';

            % Create StartEditField
            app.StartEditField = uieditfield(app.TrimAudioPanel, 'numeric');
            app.StartEditField.HorizontalAlignment = 'center';
            app.StartEditField.Position = [182 10 64 22];

            % Create StopEditFieldLabel
            app.StopEditFieldLabel = uilabel(app.TrimAudioPanel);
            app.StopEditFieldLabel.HorizontalAlignment = 'center';
            app.StopEditFieldLabel.Position = [266 10 46 22];
            app.StopEditFieldLabel.Text = 'Stop';

            % Create StopEditField
            app.StopEditField = uieditfield(app.TrimAudioPanel, 'numeric');
            app.StopEditField.HorizontalAlignment = 'center';
            app.StopEditField.Position = [311 10 70 22];

            % Create ApplyButton_2
            app.ApplyButton_2 = uibutton(app.TrimAudioPanel, 'push');
            app.ApplyButton_2.Position = [397 10 69 22];
            app.ApplyButton_2.Text = 'Apply';

            % Create VOLUMESliderLabel
            app.VOLUMESliderLabel = uilabel(app.UIFigure);
            app.VOLUMESliderLabel.HorizontalAlignment = 'right';
            app.VOLUMESliderLabel.FontWeight = 'bold';
            app.VOLUMESliderLabel.Position = [326 251 68 43];
            app.VOLUMESliderLabel.Text = 'VOLUME';

            % Create VOLUMESlider
            app.VOLUMESlider = uislider(app.UIFigure);
            app.VOLUMESlider.Limits = [0 200];
            app.VOLUMESlider.MajorTickLabels = {'0', '25', '50', '75', '100', '125', '150', '175', '200'};
            app.VOLUMESlider.Tag = 'volume';
            app.VOLUMESlider.Position = [404 281 195 3];
            app.VOLUMESlider.Value = 100;

            % Create PLAYBACKSPEEDSliderLabel
            app.PLAYBACKSPEEDSliderLabel = uilabel(app.UIFigure);
            app.PLAYBACKSPEEDSliderLabel.HorizontalAlignment = 'center';
            app.PLAYBACKSPEEDSliderLabel.FontWeight = 'bold';
            app.PLAYBACKSPEEDSliderLabel.Position = [30 189 126 43];
            app.PLAYBACKSPEEDSliderLabel.Text = 'PLAYBACK SPEED';

            % Create PLAYBACKSPEEDSlider
            app.PLAYBACKSPEEDSlider = uislider(app.UIFigure);
            app.PLAYBACKSPEEDSlider.Limits = [0 2];
            app.PLAYBACKSPEEDSlider.MajorTicks = [0 0.25 0.5 0.75 1 1.25 1.5 1.75 2];
            app.PLAYBACKSPEEDSlider.Position = [163 219 442 3];
            app.PLAYBACKSPEEDSlider.Value = 1;

            % Create NOISEREDUCTIONDropDownLabel
            app.NOISEREDUCTIONDropDownLabel = uilabel(app.UIFigure);
            app.NOISEREDUCTIONDropDownLabel.HorizontalAlignment = 'center';
            app.NOISEREDUCTIONDropDownLabel.FontWeight = 'bold';
            app.NOISEREDUCTIONDropDownLabel.Position = [30 253 126 31];
            app.NOISEREDUCTIONDropDownLabel.Text = 'NOISE REDUCTION';

            % Create NOISEREDUCTIONDropDown
            app.NOISEREDUCTIONDropDown = uidropdown(app.UIFigure);
            app.NOISEREDUCTIONDropDown.Items = {'Low', 'Standard', 'High', 'Option 4'};
            app.NOISEREDUCTIONDropDown.Position = [155 257 86 23];
            app.NOISEREDUCTIONDropDown.Value = 'Low';

            % Create ApplyButton
            app.ApplyButton = uibutton(app.UIFigure, 'push');
            app.ApplyButton.Position = [253 258 65 21];
            app.ApplyButton.Text = 'Apply';

            % Create PITCHSliderLabel
            app.PITCHSliderLabel = uilabel(app.UIFigure);
            app.PITCHSliderLabel.HorizontalAlignment = 'center';
            app.PITCHSliderLabel.FontWeight = 'bold';
            app.PITCHSliderLabel.Position = [25 128 111 43];
            app.PITCHSliderLabel.Text = 'PITCH';

            % Create PITCHSlider
            app.PITCHSlider = uislider(app.UIFigure);
            app.PITCHSlider.Limits = [-5 5];
            app.PITCHSlider.MajorTicks = [-5 -4 -3 -2 -1 0 1 2 3 4 5];
            app.PITCHSlider.MajorTickLabels = {'LOW', '', '', '', '', 'STANDARD', '', '', '', '', 'HIGH'};
            app.PITCHSlider.MinorTicks = [];
            app.PITCHSlider.Position = [155 158 454 3];

            % Create PLAYButton
            app.PLAYButton = uibutton(app.UIFigure, 'push');
            app.PLAYButton.Tag = 'playbutton';
            app.PLAYButton.FontName = 'Calibri';
            app.PLAYButton.FontSize = 14;
            app.PLAYButton.FontWeight = 'bold';
            app.PLAYButton.FontAngle = 'italic';
            app.PLAYButton.Position = [24 26 100 25];
            app.PLAYButton.Text = 'PLAY';

            % Create PAUSEButton
            app.PAUSEButton = uibutton(app.UIFigure, 'push');
            app.PAUSEButton.Tag = 'pausebutton';
            app.PAUSEButton.FontName = 'Calibri';
            app.PAUSEButton.FontSize = 14;
            app.PAUSEButton.FontWeight = 'bold';
            app.PAUSEButton.FontAngle = 'italic';
            app.PAUSEButton.Position = [135 26 100 25];
            app.PAUSEButton.Text = 'PAUSE';

            % Create SAVEButton
            app.SAVEButton = uibutton(app.UIFigure, 'push');
            app.SAVEButton.Tag = 'savebutton';
            app.SAVEButton.BackgroundColor = [0.3922 0.8314 0.0745];
            app.SAVEButton.FontSize = 14;
            app.SAVEButton.FontWeight = 'bold';
            app.SAVEButton.FontColor = [1 1 1];
            app.SAVEButton.Position = [499 25 100 24];
            app.SAVEButton.Text = 'SAVE';

            % Create RESETButton
            app.RESETButton = uibutton(app.UIFigure, 'push');
            app.RESETButton.Tag = 'resetbutton';
            app.RESETButton.FontSize = 14;
            app.RESETButton.FontWeight = 'bold';
            app.RESETButton.Position = [378 26 100 24];
            app.RESETButton.Text = 'RESET';

            % Create COMPRESSSliderLabel
            app.COMPRESSSliderLabel = uilabel(app.UIFigure);
            app.COMPRESSSliderLabel.HorizontalAlignment = 'center';
            app.COMPRESSSliderLabel.FontWeight = 'bold';
            app.COMPRESSSliderLabel.Position = [30 77 106 43];
            app.COMPRESSSliderLabel.Text = 'COMPRESS';

            % Create COMPRESSSlider
            app.COMPRESSSlider = uislider(app.UIFigure);
            app.COMPRESSSlider.Limits = [0 70];
            app.COMPRESSSlider.MajorTicks = [0 10 20 30 40 50 60 70];
            app.COMPRESSSlider.MinorTicks = [];
            app.COMPRESSSlider.Position = [155 107 458 3];

            % Create STOPButton
            app.STOPButton = uibutton(app.UIFigure, 'push');
            app.STOPButton.Tag = 'stopbutton';
            app.STOPButton.FontName = 'Calibri';
            app.STOPButton.FontSize = 14;
            app.STOPButton.FontWeight = 'bold';
            app.STOPButton.FontAngle = 'italic';
            app.STOPButton.Position = [240 24 100 25];
            app.STOPButton.Text = 'STOP';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = AudioEditor

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end