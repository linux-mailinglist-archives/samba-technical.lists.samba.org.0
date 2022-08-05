Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE62B58ACDB
	for <lists+samba-technical@lfdr.de>; Fri,  5 Aug 2022 16:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=/dM8EM9Ao+AESorZD3LuHdG8HdLjrytQYm2CPHksoIA=; b=ACekLz6WvAipjMcqXArMIChxJz
	qP4WTC0T5Nhl2nZYvBaWFZwflw5vHJuwmJUTz5g9oo73U4zqQsrdrBMlDCazuwQlUJPCNageJb5k3
	f19/8P1Tuf46sKJsY9L3xAzUbmIi+DSzsTQPUnXJmPh99N8qIXvSWgoDVDZsBBABwMm6Mj9MEXDMY
	nQUCj2hZBxvkQGU/Qp6t4ByNa6IyVNc/Vn3fbTkRUISrI0bnmTDv1sFCOMG7m/VZhZwbk+aaX1eDR
	8qJsz1oN+Gmb33xL/fbqJ9vLaj6aDAwqXHj7vA1d6XdJXS3jPTPpejiIevn1PD7sOEUehg61cujtY
	wHgKOHxQ==;
Received: from ip6-localhost ([::1]:19230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oJymw-005geT-JT; Fri, 05 Aug 2022 14:58:58 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:45845) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oJymr-005geK-TR
 for samba-technical@lists.samba.org; Fri, 05 Aug 2022 14:58:56 +0000
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10d845dcf92so3155586fac.12
 for <samba-technical@lists.samba.org>; Fri, 05 Aug 2022 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=/dM8EM9Ao+AESorZD3LuHdG8HdLjrytQYm2CPHksoIA=;
 b=jL3uX0oeJd6KMyGf5AA+jGiKP4rfYhsUCG1bEQ7Jt9g5DpZzuupgdF5rumE29/FceG
 I6YTQVw1rtpTcRfgyOI8ZpDSkhBbpiwjmPneDbdjr3PTED1kpO2BHbFP0NCNH6xcF6BZ
 GuMUUcTeLQfRTjrg8SuDQWqSNxXJiG9GvoJj0y3dhSShvt3Eq8YgyDTeLOCyxHg8GBEQ
 KZ9+sNXndKFtAZ5C30CjweO0IlB5qKD3PH/IgOmah0m7j4NsQT4ZCl+LijOrOvDygyXr
 AFGzJqL0BJTAbARFpSzhXtoCrqEb+2UlFqr7Day8LxKzqp/fG3N09s202F+S9QUtsSWJ
 FyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=/dM8EM9Ao+AESorZD3LuHdG8HdLjrytQYm2CPHksoIA=;
 b=HroSAGVEUSpfF1qigYOZqUgJK1aBDcwjRR7jVdEe5pzoqIV49hQVNsXZknUIVj+MnD
 LI3BN4cj1b/D/JzETk65GRa53WvWGEJfqOklIOqKKePhSUNnVm2cVO2liTsN/SgP5ehL
 TvRcrfozqMqijvGKq0QjJjryPXMCPhwyUNgSrn8cjArqt+9RBI/OqoqNYmY2wyYiyPYq
 2+WtYCheSmPEY26I+Ic19kxptb5yTOC2EMNsygWUNnu0D5UsjSECTj0RBQmSHFKthMZh
 ummj2Lv0WzHqI5Hhn/fh4e1PRHlYmGneBdVN8DrjdF2LfAnbVSa1AmRSYLnkwMQIIHu9
 q8Qw==
X-Gm-Message-State: ACgBeo3YQDND7BSVb7P7yjdckbJlLDJuyZ/1CWiz367VE95O4nWjphTn
 9rOCGZZsakjVlguJJRL268GPUhvt8CU7nKUE/oykr85enak=
X-Google-Smtp-Source: AA6agR5bsXTwUPQerlw8uR4NObHBaOZPB5VqbPAXcEow0qH0onSfSanza0VfqiNlu2LHw0RQYGMrUYu0WclnvkgWL90=
X-Received: by 2002:a05:6870:348f:b0:10c:991:5c5d with SMTP id
 n15-20020a056870348f00b0010c09915c5dmr6510303oah.67.1659711529011; Fri, 05
 Aug 2022 07:58:49 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 5 Aug 2022 10:58:38 -0400
Message-ID: <CAD0Ztp2+NYaYeuuXvnHqOV3+oVmq8h4jP6rHrvggJkKh2muS8g@mail.gmail.com>
Subject: smbtorture problems with encryption
To: samba-technical@lists.samba.org
Content-Type: multipart/mixed; boundary="0000000000001e137005e57fb43d"
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
From: Gordon Ross via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gordon Ross <gordon.w.ross@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000001e137005e57fb43d
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've discovered that several smbtorture tests fail if the server sets
SMB2_SESSION_FLAG_ENCRYPT_DATA in the SessionFlags on the smb2 session
setup response.
After some examination in wireshark and on the server side, it looks
like the essential problem is that after an SMB logon session has been
invalidated (either by smb2_logoff or by logon specifying a previous
session ID) then smbtorture may continue trying to use that session ID
and encryption keys to encrypt outgoing messages.  The server drops
these and disconnects because the session identified in the encryption
transform header is no longer valid.

I took a whack at trying to fix this in smbtorture with a new call to
explicitly turn off encryption for the session we've just logged off,
but my changes aren't working.  Something is turning on
"should_encrypt" and I've run out of patience trying to figure out
where.  (my failed attempt is attached) So, I'm here, asking "Any
better suggestions how to fix this?".

Thanks,
Gordon

--0000000000001e137005e57fb43d
Content-Type: application/octet-stream; 
	name="0001-Failed-attempt-to-fix-smbtorture-durable_open_reopen.patch"
Content-Disposition: attachment; 
	filename="0001-Failed-attempt-to-fix-smbtorture-durable_open_reopen.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l6gldral0>
X-Attachment-Id: f_l6gldral0

RnJvbSA4NWQyZGI2YWQwMzM1MmFhNWRjZDg1ZWNmYWJmYTU0OGVjOTgxOGE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHb3Jkb24gUm9zcyA8Z29yZG9uLncucm9zc0BnbWFpbC5jb20+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAxMDo1NzoyNiAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIEZh
aWxlZCBhdHRlbXB0IHRvIGZpeCBzbWJ0b3J0dXJlIGR1cmFibGVfb3Blbl9yZW9wZW4xYSBmb3IK
IGVuY3J5cHRpb24KCi0tLQogbGliY2xpL3NtYi9zbWJYY2xpX2Jhc2UuYyAgICAgICAgICAgfCA1
ICsrKysrCiBsaWJjbGkvc21iL3NtYlhjbGlfYmFzZS5oICAgICAgICAgICB8IDEgKwogc291cmNl
NC90b3J0dXJlL3NtYjIvZHVyYWJsZV9vcGVuLmMgfCA2ICsrKysrKwogMyBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliY2xpL3NtYi9zbWJYY2xpX2Jhc2Uu
YyBiL2xpYmNsaS9zbWIvc21iWGNsaV9iYXNlLmMKaW5kZXggZWZhZjc4Y2M3NTQuLjhlZTc2OTU3
MzRjIDEwMDY0NAotLS0gYS9saWJjbGkvc21iL3NtYlhjbGlfYmFzZS5jCisrKyBiL2xpYmNsaS9z
bWIvc21iWGNsaV9iYXNlLmMKQEAgLTU3ODksNiArNTc4OSwxMSBAQCBOVFNUQVRVUyBzbWIyY2xp
X3Nlc3Npb25fdXBkYXRlX3ByZWF1dGgoc3RydWN0IHNtYlhjbGlfc2Vzc2lvbiAqc2Vzc2lvbiwK
IAlyZXR1cm4gTlRfU1RBVFVTX09LOwogfQogCit2b2lkIHNtYjJjbGlfc2Vzc2lvbl9jbGVhcl9l
bmNyeXB0aW9uX2tleShzdHJ1Y3Qgc21iWGNsaV9zZXNzaW9uICpzZXNzaW9uKQoreworCXNlc3Np
b24tPnNtYjItPnNob3VsZF9lbmNyeXB0ID0gZmFsc2U7Cit9CisKIE5UU1RBVFVTIHNtYjJjbGlf
c2Vzc2lvbl9zZXRfc2Vzc2lvbl9rZXkoc3RydWN0IHNtYlhjbGlfc2Vzc2lvbiAqc2Vzc2lvbiwK
IAkJCQkJIGNvbnN0IERBVEFfQkxPQiBfc2Vzc2lvbl9rZXksCiAJCQkJCSBjb25zdCBzdHJ1Y3Qg
aW92ZWMgKnJlY3ZfaW92KQpkaWZmIC0tZ2l0IGEvbGliY2xpL3NtYi9zbWJYY2xpX2Jhc2UuaCBi
L2xpYmNsaS9zbWIvc21iWGNsaV9iYXNlLmgKaW5kZXggNDJjMjUxOWM3ZmYuLjU0NWM1ZTM2Y2M1
IDEwMDY0NAotLS0gYS9saWJjbGkvc21iL3NtYlhjbGlfYmFzZS5oCisrKyBiL2xpYmNsaS9zbWIv
c21iWGNsaV9iYXNlLmgKQEAgLTQ5Niw2ICs0OTYsNyBAQCB2b2lkIHNtYjJjbGlfc2Vzc2lvbl9y
ZXF1aXJlX3NpZ25lZF9yZXNwb25zZShzdHJ1Y3Qgc21iWGNsaV9zZXNzaW9uICpzZXNzaW9uLAog
CQkJCQkgICAgIGJvb2wgcmVxdWlyZV9zaWduZWRfcmVzcG9uc2UpOwogTlRTVEFUVVMgc21iMmNs
aV9zZXNzaW9uX3VwZGF0ZV9wcmVhdXRoKHN0cnVjdCBzbWJYY2xpX3Nlc3Npb24gKnNlc3Npb24s
CiAJCQkJCWNvbnN0IHN0cnVjdCBpb3ZlYyAqaW92KTsKK3ZvaWQgc21iMmNsaV9zZXNzaW9uX2Ns
ZWFyX2VuY3J5cHRpb25fa2V5KHN0cnVjdCBzbWJYY2xpX3Nlc3Npb24gKnNlc3Npb24pOwogTlRT
VEFUVVMgc21iMmNsaV9zZXNzaW9uX3NldF9zZXNzaW9uX2tleShzdHJ1Y3Qgc21iWGNsaV9zZXNz
aW9uICpzZXNzaW9uLAogCQkJCQkgY29uc3QgREFUQV9CTE9CIHNlc3Npb25fa2V5LAogCQkJCQkg
Y29uc3Qgc3RydWN0IGlvdmVjICpyZWN2X2lvdik7CmRpZmYgLS1naXQgYS9zb3VyY2U0L3RvcnR1
cmUvc21iMi9kdXJhYmxlX29wZW4uYyBiL3NvdXJjZTQvdG9ydHVyZS9zbWIyL2R1cmFibGVfb3Bl
bi5jCmluZGV4IDI3ZmJhNTFkZDFkLi4yN2Y2ZjY3MTdkOCAxMDA2NDQKLS0tIGEvc291cmNlNC90
b3J0dXJlL3NtYjIvZHVyYWJsZV9vcGVuLmMKKysrIGIvc291cmNlNC90b3J0dXJlL3NtYjIvZHVy
YWJsZV9vcGVuLmMKQEAgLTQ3NSw3ICs0NzUsMTAgQEAgc3RhdGljIGJvb2wgdGVzdF9kdXJhYmxl
X29wZW5fcmVvcGVuMWEoc3RydWN0IHRvcnR1cmVfY29udGV4dCAqdGN0eCwKIAogCS8qCiAJICog
Y2hlY2sgdGhhdCB0aGlzIGhhcyBkZWxldGVkIHRoZSBvbGQgc2Vzc2lvbgorCSAqIE5vdGU6IHRo
ZSBvcmlnIHNlcy4gKHRyZWUpIGNhbiBOTyBsb25nZXIgZW5jcnlwdCwKKwkgKiBiZWNhdXNlIHdl
IGxvZ2dlZCBpdCBvZmYgdmlhIHByZXYuIHNzbi4gSUQKIAkgKi8KKwlzbWIyY2xpX3Nlc3Npb25f
Y2xlYXJfZW5jcnlwdGlvbl9rZXkodHJlZS0+c2Vzc2lvbi0+c21iWGNsaSk7CiAKIAlaRVJPX1NU
UlVDVChpbyk7CiAJaW8uaW4uZm5hbWUgPSBmbmFtZTsKQEAgLTUxNiw3ICs1MTksMTAgQEAgc3Rh
dGljIGJvb2wgdGVzdF9kdXJhYmxlX29wZW5fcmVvcGVuMWEoc3RydWN0IHRvcnR1cmVfY29udGV4
dCAqdGN0eCwKIAogCS8qCiAJICogY2hlY2sgdGhhdCB0aGlzIGhhcyBkZWxldGVkIHRoZSBvbGQg
c2Vzc2lvbgorCSAqIE5vdGU6IHRoZSBvcmlnIHNlcy4gdHJlZTIgY2FuIE5PIGxvbmdlciBlbmNy
eXB0LAorCSAqIGJlY2F1c2Ugd2UgbG9nZ2VkIGl0IG9mZiB2aWEgcHJldi4gc3NuLiBJRAogCSAq
LworCXNtYjJjbGlfc2Vzc2lvbl9jbGVhcl9lbmNyeXB0aW9uX2tleSh0cmVlMi0+c2Vzc2lvbi0+
c21iWGNsaSk7CiAKIAlaRVJPX1NUUlVDVChpbyk7CiAJaW8uaW4uZm5hbWUgPSBmbmFtZTsKLS0g
CjIuMzUuMQoK
--0000000000001e137005e57fb43d--

