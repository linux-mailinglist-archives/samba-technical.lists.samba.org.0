Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1F72D59E
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 08:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=IiCYyNdZ3lHC68HLkVWD4Bl6y5Eh7VnkFb6JrQ8uKu4=; b=cq7YSCVyJLVQoRoqfw2eMqd4t6
	dj5Va63k+blQ4RI7AIIpK4S6pnToHefafSiCHxHzowRTXMSttGfoALAfAnGS5U0FoNJW2O7ljv1Vs
	Lu1yZOx0CoK0Mwmco+tTIMUv/JUs0VfUd7+9Z+O6vfJ5r5ht9CQMDQmayqL2frs6ALIRJhcqt6QbC
	98L8tzvEG9S9qEZr9st/kEWvoEkzg+Xyu4ZQvrQtAQzg8XPpSvRvG6LJrEBKHOruRXuKyKEE0gv4I
	+MxLc0RyQWPzV/XsWxoO/+qoHP2sfCo6PaHKNLlx1b0sILhIjZey40oXoqzXBWWKegTao+0MHryNe
	n231cqnA==;
Received: from localhost ([::1]:18242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVsH6-002Rwf-TF; Wed, 29 May 2019 06:41:25 +0000
Received: from confino.investici.org ([2a00:c38:11e:ffff::a020]:26034) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVsGv-002RwY-I4
 for samba-technical@lists.samba.org; Wed, 29 May 2019 06:41:16 +0000
Received: from [212.103.72.250] (confino [212.103.72.250]) (Authenticated
 sender: anoopcs@autistici.org) by localhost (Postfix) with ESMTPSA id
 ED16562967
 for <samba-technical@lists.samba.org>; Wed, 29 May 2019 06:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1559112062;
 bh=IiCYyNdZ3lHC68HLkVWD4Bl6y5Eh7VnkFb6JrQ8uKu4=;
 h=Subject:From:To:Date;
 b=PMTDOM0a0ehB5wtBFO8eXgFjOiWZ+5gf6k23rnNlDvS/QgSzba3gb3qCSszqldVJg
 EwG8kdNH58YoV84zR175Hgc1O1pf1gssZ6qS9eQhKVKwn7I3+n/JXiMXpwP+be0FWw
 5RYbpwD61vdRMHuwDGffP7L52MckD73gpyZV74Bc=
Message-ID: <42f879d1e0abfd4dd2e6c299b9184a7dfc5afacd.camel@cryptolab.net>
Subject: [PATCH] Fix compile error with --enable-selftest
To: samba-technical <samba-technical@lists.samba.org>
Date: Wed, 29 May 2019 12:10:53 +0530
Content-Type: multipart/mixed; boundary="=-9ks1ib27Oc3vIMktURxo"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-9ks1ib27Oc3vIMktURxo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Please find the attached patch which fixes the following error while
compiling with --enable-selftest configure option:

../../source3/utils/smbcontrol.c: In function ‘do_sleep’:
../../source3/utils/smbcontrol.c:435:2: error: ‘input’ undeclared
(first use in this function)
  435 |  input = atol(argv[1]);
      |  ^~~~~
../../source3/utils/smbcontrol.c:435:2: note: each undeclared
identifier is reported only once for each function it appears in
../../source3/utils/smbcontrol.c:436:27: error: ‘MAX_SLEEP’ undeclared
(first use in this function)
  436 |  if (input < 1 || input > MAX_SLEEP) {
      |                           ^~~~~~~~~
../../source3/utils/smbcontrol.c:444:2: error: ‘seconds’ undeclared
(first use in this function); did you mean ‘send’?
  444 |  seconds = input;
      |  ^~~~~~~
      |  send

CI run: https://gitlab.com/samba-team/devel/samba/pipelines/63654943

Reviews are appreciated.

Anoop C S.

--=-9ks1ib27Oc3vIMktURxo
Content-Disposition: attachment;
	filename*0=0001-s3-smbcontrol-Replace-with-to-declare-variables-in-d.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-s3-smbcontrol-Replace-with-to-declare-variables-in-d.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAxNTA4NDExN2Q2ZGNlYmJjZDgxMTI2NjFhYjFhN2YwZWU4ZWZjZTFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbm9vcCBDIFMgPGFub29wY3NAcmVkaGF0LmNvbT4KRGF0ZTog
V2VkLCAyOSBNYXkgMjAxOSAxMTo0MDo1NSArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIHMzLXNtYmNv
bnRyb2w6IFJlcGxhY2UgJiYgd2l0aCB8fCB0byBkZWNsYXJlIHZhcmlhYmxlcyBpbgogZG9fc2xl
ZXAoKQoKLS1lbmFibGUtZGV2ZWxvcGVyIGludGVybmFsbHkgdXNlIC0tZW5hYmxlLXNlbGZ0ZXN0
IGFsb25nc2lkZS4gQnV0IHdoZW4KY29uZmlndXJlZCBvbmx5IHdpdGggLS1lbmFibGUtc2VsZnRl
c3QgdGhlIGZvbGxvd2luZyBjb2RlIGJsb2NrIGJlY29tZXMKaW52YWxpZDoKCiAjaWYgZGVmaW5l
ZChERVZFTE9QRVIpICYmIGRlZmluZWQoRU5BQkxFX1NFTEZURVNUKQogICAgICAgIHVuc2lnbmVk
IGludCBzZWNvbmRzOwogICAgICAgIGxvbmcgaW5wdXQ7CiAgICAgICAgY29uc3QgbG9uZyBNQVhf
U0xFRVAgPSA2MCAqIDYwOyAvKiBPbmUgaG91ciBtYXhpbXVtIHNsZWVwICovCiAjZW5kaWYKCm1h
a2luZyB0aG9zZSB2YXJpYWJsZXMgdW5kZWNhbHJlZCBmb3IgZnVydGhlciB1c2UuIFRoZXJlZm9y
ZSByZXBsYWNlICYmCndpdGggfHwgdG8gaGF2ZSB0aG9zZSB2YXJpYWJsZXMgZGVjbGFyZWQgd2l0
aCAtLWVuYWJsZS1zZWxmdGVzdApjb25maWd1cmUgb3B0aW9uLgoKU2lnbmVkLW9mZi1ieTogQW5v
b3AgQyBTIDxhbm9vcGNzQHJlZGhhdC5jb20+Ci0tLQogc291cmNlMy91dGlscy9zbWJjb250cm9s
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9zb3VyY2UzL3V0aWxzL3NtYmNvbnRyb2wuYyBiL3NvdXJjZTMvdXRpbHMv
c21iY29udHJvbC5jCmluZGV4IDdhNzYxYTZmZjU5Li5iMmFhMWRmYTJhNiAxMDA2NDQKLS0tIGEv
c291cmNlMy91dGlscy9zbWJjb250cm9sLmMKKysrIGIvc291cmNlMy91dGlscy9zbWJjb250cm9s
LmMKQEAgLTQxNSw3ICs0MTUsNyBAQCBzdGF0aWMgYm9vbCBkb19zbGVlcChzdHJ1Y3QgdGV2ZW50
X2NvbnRleHQgKmV2X2N0eCwKIAkJICAgICBjb25zdCBzdHJ1Y3Qgc2VydmVyX2lkIHBpZCwKIAkJ
ICAgICBjb25zdCBpbnQgYXJnYywgY29uc3QgY2hhciAqKmFyZ3YpCiB7Ci0jaWYgZGVmaW5lZChE
RVZFTE9QRVIpICYmIGRlZmluZWQoRU5BQkxFX1NFTEZURVNUKQorI2lmIGRlZmluZWQoREVWRUxP
UEVSKSB8fCBkZWZpbmVkKEVOQUJMRV9TRUxGVEVTVCkKIAl1bnNpZ25lZCBpbnQgc2Vjb25kczsK
IAlsb25nIGlucHV0OwogCWNvbnN0IGxvbmcgTUFYX1NMRUVQID0gNjAgKiA2MDsgLyogT25lIGhv
dXIgbWF4aW11bSBzbGVlcCAqLwotLSAKMi4yMS4wCgo=


--=-9ks1ib27Oc3vIMktURxo--


