Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C71675306CC
	for <lists+samba-technical@lfdr.de>; Mon, 23 May 2022 02:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=BXlXcrtdB+MCZFrhZ0z1VdX2ZQCbj8lUlYw2sPrlbds=; b=DWkg7+9xDydPA2wT9Y/I16aX5n
	ACjZX940RID+KjBzv0MewpYndF8Dd8GA0jotrm4ddU5KunMUzMJri4ioDizpMUDeNkeVR1oMw/5ni
	059r3Edy83gRVwmZEML9etwDqmQjcvYfKeo5UxcEawkJnH7mhqNtgbVDS4fZFWbZ+I9XNmF7le1uz
	NWI3+zzyzhdPYT24zy+6oqKdSK9bp/6tB4qRa2sF8LXOpAfukRBvZ6B7d1GLtF2ZvWr9d8TJXof2d
	Z8fWE+glnKonOg7Gc0o+WBfNShkT6CJzHtARWyrbbG4o+suK1Tsa6z6yDdoDSv8iHyR80LyJAwN3s
	sA/qFMiw==;
Received: from ip6-localhost ([::1]:43774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nsvdw-002RdS-RR; Mon, 23 May 2022 00:09:52 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b]:46595) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nsvds-002RdJ-8G
 for samba-technical@lists.samba.org; Mon, 23 May 2022 00:09:50 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id m203so6371602vke.13
 for <samba-technical@lists.samba.org>; Sun, 22 May 2022 17:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=BXlXcrtdB+MCZFrhZ0z1VdX2ZQCbj8lUlYw2sPrlbds=;
 b=P6/w1hf50+RZ3RxMQ1ULqpPm3YPa3Sds4ghE7alrKxxBK1jjWrRj28qTxEYetgnt6v
 egAnAq5pscNtj2wEomEsfM3N60/VA5G2uGIdsmYNsaBrPY2oOfcLqwYpgYUmlxGOSE8Q
 U+ZVji90y1VL2hfGMYQNZdHrRHqMDeO480rxchMA6aeRzK0qNsHqwPm5O8JeKu9zQCSR
 Wcik+HNItuMQFMDwaCtYu8YsNeb+K06gxcxmSdD5ChHOnSEhUcdD37A57GrOrLpQHoR4
 XKk23HnJl/edQGr26KXIAmAsBr56osE9o1t3KgcIcT2uI/r4S5QSxVlnRWhntNon41/j
 w9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=BXlXcrtdB+MCZFrhZ0z1VdX2ZQCbj8lUlYw2sPrlbds=;
 b=qUQTN1EZyAVgdvUn41uXiQPUvWQ94B/SS+xXfPFPS05K2EVyA+9/NCJFRGvGfWXN0r
 cOYiq8rCVwVopq4Gl/5RJCJ02d9E9zvoOo5WvKow1A5zj320wg2sBLp8mKI4+LKNeTer
 DEMBhgfdePqXIOmv/I/1gCJJuxUagTXqnsObjZnpxS0rwCheeRdV0ioHBxh3ec+pzuA6
 asyYJHA5+h5UQY6WnT/iq6M0UL1QdqRRJN6s4XTDKZhAysBr5vED+0QWdU9r3tQfjGnK
 jEbul05JQPPEWOURcumVtxcbt0OgcJ3hQhdIQsekWewGq5TGa3EV9NK6BhDAE+RWZ8aq
 Ns7g==
X-Gm-Message-State: AOAM530C+FegcP/OrNrxWSRphr3rgaRjRQxLf+ioaLAI1HU2xhfZDNjm
 FORVVlZt9tuwJTVOAwZtQ0JqDOrlz7t1uK5BpUE=
X-Google-Smtp-Source: ABdhPJxVOLCOszD4KwfmehfHpQQpKNUT/IwC7tr5x5Qw+0tjfdOJWudXK4Iyny5fMktzTOZjYbjNdE/Rjy/rglvzgvI=
X-Received: by 2002:a1f:a7d5:0:b0:34e:4447:6309 with SMTP id
 q204-20020a1fa7d5000000b0034e44476309mr6990182vke.38.1653264586092; Sun, 22
 May 2022 17:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muiMW76Xt2zRNJWTcQVuewEj3Qs3p4oc8tvEyw5f6528g@mail.gmail.com>
In-Reply-To: <CAH2r5muiMW76Xt2zRNJWTcQVuewEj3Qs3p4oc8tvEyw5f6528g@mail.gmail.com>
Date: Sun, 22 May 2022 19:09:34 -0500
Message-ID: <CAH2r5mveWTtio_Aei3VEht6KaxU6quSgwgopvXbFfMtE40q0YQ@mail.gmail.com>
Subject: Re: [PATCH][SMB3] Add defines for various newer FSCTLs
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000005fcfc405dfa2a889"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000005fcfc405dfa2a889
Content-Type: text/plain; charset="UTF-8"

Fixed minor typo in one define


On Sun, May 22, 2022 at 6:36 PM Steve French <smfrench@gmail.com> wrote:
>
> Checking MS-FSCC section 2.3 found six FSCTL defines that were missing
>
> See attached
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

--0000000000005fcfc405dfa2a889
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3-Add-defines-for-various-newer-FSCTLs.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3-Add-defines-for-various-newer-FSCTLs.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l3hz1g4d0>
X-Attachment-Id: f_l3hz1g4d0

RnJvbSA4MmE3MGUzNDFiOTRmZGYwMmE2MWVmNzExOGFiMzRhOWMxNWY5ZjRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgMjIgTWF5IDIwMjIgMTg6MzA6MzggLTA1MDAKU3ViamVjdDogW1BBVENIXSBb
U01CM10gQWRkIGRlZmluZXMgZm9yIHZhcmlvdXMgbmV3ZXIgRlNDVExzCgpDaGVja2luZyBNUy1G
U0NDIHNlY3Rpb24gMi4zIGZvdW5kIHNpeCBGU0NUTCBkZWZpbmVzCnRoYXQgd2VyZSBtaXNzaW5n
CgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0t
LQogZnMvc21iZnNfY29tbW9uL3NtYmZzY3RsLmggfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYmZzX2NvbW1vbi9zbWJmc2N0bC5o
IGIvZnMvc21iZnNfY29tbW9uL3NtYmZzY3RsLmgKaW5kZXggZDUxOTM5YzQzYWQ3Li45ZTllODZk
ZTk1ZjYgMTAwNjQ0Ci0tLSBhL2ZzL3NtYmZzX2NvbW1vbi9zbWJmc2N0bC5oCisrKyBiL2ZzL3Nt
YmZzX2NvbW1vbi9zbWJmc2N0bC5oCkBAIC04OCwyMSArODgsMjcgQEAKICNkZWZpbmUgRlNDVExf
UkVBRF9SQVdfRU5DUllQVEVEICAgICAweDAwMDkwMEUzIC8qIEJCIGFkZCBzdHJ1Y3QgKi8KICNk
ZWZpbmUgRlNDVExfUkVBRF9GSUxFX1VTTl9EQVRBICAgICAweDAwMDkwMEVCIC8qIEJCIGFkZCBz
dHJ1Y3QgKi8KICNkZWZpbmUgRlNDVExfV1JJVEVfVVNOX0NMT1NFX1JFQ09SRCAweDAwMDkwMEVG
IC8qIEJCIGFkZCBzdHJ1Y3QgKi8KKyNkZWZpbmUgRlNDVExfTUFSS19IQU5ETEUJICAgICAweDAw
MDkwMEZDIC8qIEJCIGFkZCBzdHJ1Y3QgKi8KICNkZWZpbmUgRlNDVExfU0lTX0NPUFlGSUxFICAg
ICAgICAgICAweDAwMDkwMTAwIC8qIEJCIGFkZCBzdHJ1Y3QgKi8KICNkZWZpbmUgRlNDVExfUkVD
QUxMX0ZJTEUgICAgICAgICAgICAweDAwMDkwMTE3IC8qIEJCIGFkZCBzdHJ1Y3QgKi8KICNkZWZp
bmUgRlNDVExfUVVFUllfU1BBUklOR19JTkZPICAgICAweDAwMDkwMTM4IC8qIEJCIGFkZCBzdHJ1
Y3QgKi8KKyNkZWZpbmUgRlNDVExfUVVFUllfT05fRElTS19WT0xVTUVfSU5GTyAweDAwMDkwMTND
CiAjZGVmaW5lIEZTQ1RMX1NFVF9aRVJPX09OX0RFQUxMT0MgICAgMHgwMDA5MDE5NCAvKiBCQiBh
ZGQgc3RydWN0ICovCiAjZGVmaW5lIEZTQ1RMX1NFVF9TSE9SVF9OQU1FX0JFSEFWSU9SIDB4MDAw
OTAxQjQgLyogQkIgYWRkIHN0cnVjdCAqLwogI2RlZmluZSBGU0NUTF9HRVRfSU5URUdSSVRZX0lO
Rk9STUFUSU9OIDB4MDAwOTAyN0MKKyNkZWZpbmUgRlNDVExfUVVFUllfRklMRV9SRUdJT05TICAg
ICAweDAwMDkwMjg0CiAjZGVmaW5lIEZTQ1RMX0dFVF9SRUZTX1ZPTFVNRV9EQVRBICAgMHgwMDA5
MDJEOCAvKiBTZWUgTVMtRlNDQyAyLjMuMjQgKi8KICNkZWZpbmUgRlNDVExfU0VUX0lOVEVHUklU
WV9JTkZPUk1BVElPTl9FWFQgMHgwMDA5MDM4MAogI2RlZmluZSBGU0NUTF9HRVRfUkVUUklFVkFM
X1BPSU5URVJTX0FORF9SRUZDT1VOVCAweDAwMDkwM2QzCiAjZGVmaW5lIEZTQ1RMX0dFVF9SRVRS
SUVWQUxfUE9JTlRFUl9DT1VOVCAweDAwMDkwNDJiCiAjZGVmaW5lIEZTQ1RMX1JFRlNfU1RSRUFN
X1NOQVBTSE9UX01BTkFHRU1FTlQgMHgwMDA5MDQ0MAogI2RlZmluZSBGU0NUTF9RVUVSWV9BTExP
Q0FURURfUkFOR0VTIDB4MDAwOTQwQ0YKKyNkZWZpbmUgRlNDVExfT0ZGTE9BRF9SRUFECTB4MDAw
OTQyNjQgLyogQkIgYWRkIHN0cnVjdCAqLworI2RlZmluZSBGU0NUTF9PRkZMT0FEX1dSSVRFCTB4
MDAwOTgyNjggLyogQkIgYWRkIHN0cnVjdCAqLwogI2RlZmluZSBGU0NUTF9TRVRfREVGRUNUX01B
TkFHRU1FTlQgIDB4MDAwOTgxMzQgLyogQkIgYWRkIHN0cnVjdCAqLwogI2RlZmluZSBGU0NUTF9G
SUxFX0xFVkVMX1RSSU0gICAgICAgIDB4MDAwOTgyMDggLyogQkIgYWRkIHN0cnVjdCAqLwogI2Rl
ZmluZSBGU0NUTF9EVVBMSUNBVEVfRVhURU5UU19UT19GSUxFIDB4MDAwOTgzNDQKKyNkZWZpbmUg
RlNDVExfRFVQTElDQVRFX0VYVEVOVFNfVE9fRklMRV9FWCAweDAwMDk4M0U4CiAjZGVmaW5lIEZT
Q1RMX1NJU19MSU5LX0ZJTEVTICAgICAgICAgMHgwMDA5QzEwNAogI2RlZmluZSBGU0NUTF9TRVRf
SU5URUdSSVRZX0lORk9STUFUSU9OIDB4MDAwOUMyODAKICNkZWZpbmUgRlNDVExfUElQRV9QRUVL
ICAgICAgICAgICAgICAweDAwMTE0MDBDIC8qIEJCIGFkZCBzdHJ1Y3QgKi8KLS0gCjIuMzQuMQoK
--0000000000005fcfc405dfa2a889--

