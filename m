Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 670789DA5F7
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2024 11:38:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=y7UcAEnUEzQKStFWEeOVkiYtBXQagKft50aGEY1tv3w=; b=2PIJF3gvcRc/6Sz7sW98n5ZCJ5
	3xtWrvpPnxaT2pLxj8pISVniBoDk5iKFRGYtkHDFfBjs7KTXb2PToO2e42vp2G5nauIftfqEw4HU+
	lXtk/yeuP8pU9FEAoOHDCzlmuSN4E/kyiDRLG29Zc/td0qfHCnoJF57xxxbSDMUy/NhjIQgMMIQyc
	PnDGZ1xAImUJXkcEt7RBujhY+HCT+E9ZsUvRwsyPvmZQuCsjnMrF+JtkZi0MaGnATDKFyJkWiC5wQ
	dPh9XACgljhxAF35LZFPOGdRQ/xw44ubT3MrYVaAUMc8zEo/QKCR01kpVBaA7PYOs1idvzMQubCw4
	QKjfF39Q==;
Received: from ip6-localhost ([::1]:52146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tGFQw-000xso-Gg; Wed, 27 Nov 2024 10:38:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54024) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGFQr-000xsh-I2
 for samba-technical@lists.samba.org; Wed, 27 Nov 2024 10:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=y7UcAEnUEzQKStFWEeOVkiYtBXQagKft50aGEY1tv3w=; b=WETiuWJSNpfq8HHXxwnCqZn+8+
 HH8kMVEWwHe3nxwgowDU+uFfqEjgaquOAaOLtAu2KVxM9lnbZTfqOxBkmQS4uHbpJHc7B5h5Nr7/L
 0z/KsFp6nYldMpkEsp1/PRXmgULwtpcufHrhyb4gPE3YecROjrA2GLCsdvXwa1hT1Rb35FmqT5mLn
 z0UgS9da07GxwgbDkURZ0ROBbtLijICdnNEBlnhDL+4QK5Rm6ZafLU6TNpkZ+eRfl83VAgA4gJiXn
 2sobXjhfxn04RyU0z7APqU1Inv/2RiPoNU8wvpFfwffFqSkeUF/bRntIb4neqTO/P5CefHxPPhG3V
 JLE/8olfbpJBs/78YyuBmAWD+wxfBuDJYKFGd8oTpSq4i+uPr2XVou7LwloknD3msEVidmeq/M9Lo
 K6Xo4Y3zrH5e6gJB1lG9NoyFq6xM8e2jnjKpcC2KrH+Fg3QfBqasI+CmkVSg240c8dQ+kKn85MLJg
 CunXfq5LFTQCdLAf7RqtwgHQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGFQq-001gqM-2u for samba-technical@lists.samba.org;
 Wed, 27 Nov 2024 10:38:04 +0000
Content-Type: multipart/mixed; boundary="------------kvT1dp0fI5oF7lgiHLBBo25t"
Message-ID: <a3eb2bd9-9000-4cf2-84e8-3096dbf43de8@samba.org>
Date: Wed, 27 Nov 2024 11:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: [FOSDEM] Call for participation: Software Defined Storage devroom
Content-Language: en-US
References: <1bed729b-e67d-495b-af66-22b7e163fa19@samba.org>
To: Samba Technical <samba-technical@lists.samba.org>
In-Reply-To: <1bed729b-e67d-495b-af66-22b7e163fa19@samba.org>
X-Forwarded-Message-Id: <1bed729b-e67d-495b-af66-22b7e163fa19@samba.org>
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
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
From: =?utf-8?q?G=C3=BCnther_Deschner_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?G=C3=BCnther_Deschner?= <gd@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------kvT1dp0fI5oF7lgiHLBBo25t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

just like last year there is a "Software Defined Storage devroom" at 
FOSDEM in February next year. Attached is the announcement of the call 
for proposals. In the past years there were many very interesting Samba 
related presentations already.

Please consider submitting a talk proposal if you are able to attend
FOSDEM! There are only few days left, the deadline is already December 
1st, 2024.

Thanks,
Guenther

-------- Forwarded Message --------
From: Jan Fajerski <jan@fajerski.name>
To: fosdem@lists.fosdem.org1:49 +0100
Subject: [FOSDEM] Call for participation: Software Defined Storage 
devroom at FOSDEM 2025

FOSDEM is a free software event that offers open source communities a 
place to
meet, share ideas and collaborate.  It is well known for being highly
developer-oriented and in the past brought together 8000+ participants from
all over the world. Its home is in the city of Brussels (Belgium).

FOSDEM 2025 will take place as an in-person event during the weekend of 
February
1/2 2025. More details about the event can be found at http://fosdem.org/

** Call For Participation

The Software Defined Storage devroom will go into its 9. iteration for talks
around Open Source Software Defined Storage projects, management tools
and real world deployments.

Presentation topics could include but are not limited too:

- Your work on a SDS project like Ceph, Gluster, Garage, OpenEBS, CORTX or
     Longhorn

- Your work on or with SDS related projects like Samba, OpenStack SWIFT or
     Container Storage Interface

- Management tools for SDS deployments

- Monitoring tools for SDS clusters

** Important dates:

- Dec 1, 2024: submission deadline for talk proposals
- Dec 8, 2024: announcement of the final schedule
- Feb 1, 2025: Software Defined Storage dev room

Talk proposals will be reviewed by a steering committee:
- Niels de Vos (IBM)
- Jan Fajerski (Red Hat)
- Hugo Gonzalez Labrador (CERN)
- Abhishek Lekshmanan (CERN)
- Richard Bachmann (CERN)

We also welcome additional volunteers to help with making this devroom a
success.

Please submit talks at https://fosdem.org/submit.
- Important! Select the "Software Defined Storage devroom" track.

Hope to hear from you soon! And please forward this announcement.

If you have any further questions, please write to the mailing list at
storage-devroom at lists.fosdem.org and we will try to answer as soon as
possible.


Thanks!

-- 
Günther Deschner                    GPG-ID: 8EE11688
Red Hat                         gdeschner@redhat.com
Samba Team                              gd@samba.org

--------------kvT1dp0fI5oF7lgiHLBBo25t
Content-Type: text/plain; charset=UTF-8; name="FOSDEM-SDS-DEVROOM.txt"
Content-Disposition: attachment; filename="FOSDEM-SDS-DEVROOM.txt"
Content-Transfer-Encoding: base64

RnJvbSBqYW4gYXQgZmFqZXJza2kubmFtZSAgTW9uIE9jdCAyOCAxNjozMTo0OSAyMDI0CkZy
b206IGphbiBhdCBmYWplcnNraS5uYW1lIChKYW4gRmFqZXJza2kpCkRhdGU6IE1vbiwgMjgg
T2N0IDIwMjQgMTc6MzE6NDkgKzAxMDAKU3ViamVjdDogW0ZPU0RFTV0gQ2FsbCBmb3IgcGFy
dGljaXBhdGlvbjogU29mdHdhcmUgRGVmaW5lZCBTdG9yYWdlIGRldnJvb20KIGF0IEZPU0RF
TSAyMDI1Ck1lc3NhZ2UtSUQ6IDxzdmw0bGltYWY1aXM1bmVqemFmNmpmdGl6ZmJoNWk3YXYz
aTVlcXpva2J6dnZlcXd3ekA0YnNpbndicm1qcnc+CgpGT1NERU0gaXMgYSBmcmVlIHNvZnR3
YXJlIGV2ZW50IHRoYXQgb2ZmZXJzIG9wZW4gc291cmNlIGNvbW11bml0aWVzIGEgcGxhY2Ug
dG8KbWVldCwgc2hhcmUgaWRlYXMgYW5kIGNvbGxhYm9yYXRlLsKgIEl0IGlzIHdlbGwga25v
d24gZm9yIGJlaW5nIGhpZ2hseQpkZXZlbG9wZXItb3JpZW50ZWQgYW5kIGluIHRoZSBwYXN0
IGJyb3VnaHQgdG9nZXRoZXIgODAwMCsgcGFydGljaXBhbnRzIGZyb20KYWxsIG92ZXIgdGhl
IHdvcmxkLiBJdHMgaG9tZSBpcyBpbiB0aGUgY2l0eSBvZiBCcnVzc2VscyAoQmVsZ2l1bSku
CgpGT1NERU0gMjAyNSB3aWxsIHRha2UgcGxhY2UgYXMgYW4gaW4tcGVyc29uIGV2ZW50IGR1
cmluZyB0aGUgd2Vla2VuZCBvZiBGZWJydWFyeQoxLzIgMjAyNS4gTW9yZSBkZXRhaWxzIGFi
b3V0IHRoZSBldmVudCBjYW4gYmUgZm91bmQgYXQgaHR0cDovL2Zvc2RlbS5vcmcvCgoqKiBD
YWxsIEZvciBQYXJ0aWNpcGF0aW9uCgpUaGUgU29mdHdhcmUgRGVmaW5lZCBTdG9yYWdlIGRl
dnJvb20gd2lsbCBnbyBpbnRvIGl0cyA5LiBpdGVyYXRpb24gZm9yIHRhbGtzCmFyb3VuZCBP
cGVuIFNvdXJjZSBTb2Z0d2FyZSBEZWZpbmVkIFN0b3JhZ2UgcHJvamVjdHMsIG1hbmFnZW1l
bnQgdG9vbHMKYW5kIHJlYWwgd29ybGQgZGVwbG95bWVudHMuCgpQcmVzZW50YXRpb24gdG9w
aWNzIGNvdWxkIGluY2x1ZGUgYnV0IGFyZSBub3QgbGltaXRlZCB0b286CgotIFlvdXIgd29y
ayBvbiBhIFNEUyBwcm9qZWN0IGxpa2UgQ2VwaCwgR2x1c3RlciwgR2FyYWdlLCBPcGVuRUJT
LCBDT1JUWCBvciAKICAgTG9uZ2hvcm4KCi0gWW91ciB3b3JrIG9uIG9yIHdpdGggU0RTIHJl
bGF0ZWQgcHJvamVjdHMgbGlrZSBTYW1iYSwgT3BlblN0YWNrIFNXSUZUIG9yIAogICBDb250
YWluZXIgU3RvcmFnZSBJbnRlcmZhY2UKCi0gTWFuYWdlbWVudCB0b29scyBmb3IgU0RTIGRl
cGxveW1lbnRzCgotIE1vbml0b3JpbmcgdG9vbHMgZm9yIFNEUyBjbHVzdGVycwoKKiogSW1w
b3J0YW50IGRhdGVzOgoKLSBEZWMgMSwgMjAyNDogc3VibWlzc2lvbiBkZWFkbGluZSBmb3Ig
dGFsayBwcm9wb3NhbHMKLSBEZWMgOCwgMjAyNDogYW5ub3VuY2VtZW50IG9mIHRoZSBmaW5h
bCBzY2hlZHVsZQotIEZlYiAxLCAyMDI1OiBTb2Z0d2FyZSBEZWZpbmVkIFN0b3JhZ2UgZGV2
IHJvb20KClRhbGsgcHJvcG9zYWxzIHdpbGwgYmUgcmV2aWV3ZWQgYnkgYSBzdGVlcmluZyBj
b21taXR0ZWU6Ci0gTmllbHMgZGUgVm9zIChJQk0pCi0gSmFuIEZhamVyc2tpIChSZWQgSGF0
KQotIEh1Z28gR29uemFsZXogTGFicmFkb3IgKENFUk4pCi0gQWJoaXNoZWsgTGVrc2htYW5h
biAoQ0VSTikKLSBSaWNoYXJkIEJhY2htYW5uIChDRVJOKQoKV2UgYWxzbyB3ZWxjb21lIGFk
ZGl0aW9uYWwgdm9sdW50ZWVycyB0byBoZWxwIHdpdGggbWFraW5nIHRoaXMgZGV2cm9vbSBh
CnN1Y2Nlc3MuCgpQbGVhc2Ugc3VibWl0IHRhbGtzIGF0IGh0dHBzOi8vZm9zZGVtLm9yZy9z
dWJtaXQuCi0gSW1wb3J0YW50ISBTZWxlY3QgdGhlICJTb2Z0d2FyZSBEZWZpbmVkIFN0b3Jh
Z2UgZGV2cm9vbSIgdHJhY2suCgpIb3BlIHRvIGhlYXIgZnJvbSB5b3Ugc29vbiEgQW5kIHBs
ZWFzZSBmb3J3YXJkIHRoaXMgYW5ub3VuY2VtZW50LgoKSWYgeW91IGhhdmUgYW55IGZ1cnRo
ZXIgcXVlc3Rpb25zLCBwbGVhc2Ugd3JpdGUgdG8gdGhlIG1haWxpbmcgbGlzdCBhdApzdG9y
YWdlLWRldnJvb20gYXQgbGlzdHMuZm9zZGVtLm9yZyBhbmQgd2Ugd2lsbCB0cnkgdG8gYW5z
d2VyIGFzIHNvb24gYXMKcG9zc2libGUuCgoKVGhhbmtzIQoK

--------------kvT1dp0fI5oF7lgiHLBBo25t--

