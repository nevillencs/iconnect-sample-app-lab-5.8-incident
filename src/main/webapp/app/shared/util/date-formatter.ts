// import { NgbDateParserFormatter, NgbDateStruct } from '@ng-bootstrap/ng-bootstrap';

// /* eslint-disable no-console */
// console.log("This show ups in the browser")

// export class CustomDateParserFormatter extends NgbDateParserFormatter {
//   parse(value: string): NgbDateStruct | null {
//     /* eslint-disable no-console */
//     console.log('[CUSTOM FORMATTER] parse called with:', value);
//     if (value) {
//       const parts = value.trim().split('-');
//       /* eslint-disable no-console */
//       console.log('PARSE:', value, parts);
//       if (parts.length === 3) {
//         return {
//           day: +parts[0],
//           month: +parts[1],
//           year: +parts[2]
//         };
//       }
//     }
//     return null;
//   }

//   format(date: NgbDateStruct | null): string {
//     return date
//       ? `${this.pad(date.day)}/${this.pad(date.month)}/${date.year}`
//       : '';
//   }

//   private pad(n: number): string {
//     return n < 10 ? `0${n}` : `${n}`;
//   }
// }

import { NgbDateParserFormatter, NgbDateStruct } from '@ng-bootstrap/ng-bootstrap';
import * as moment from 'moment';

export class CustomDateParserFormatter extends NgbDateParserFormatter {
    parse(value: string): NgbDateStruct | null {
        if (value) {
            const parts = value.trim().split('-'); // Accept both - and /
            if (parts.length === 3) {
                return {
                    day: +parts[0],
                    month: +parts[1],
                    year: +parts[2]
                };
            }
        }
        return null;
    }

    format(date: NgbDateStruct | moment.Moment | null): string {
        if (!date) {
            return '';
        }
        if (moment.isMoment(date)) {
            return date.format('DD-MM-YYYY');
        }
    }

    private pad(n: number): string {
        return n < 10 ? `0${n}` : `${n}`;
    }
}
