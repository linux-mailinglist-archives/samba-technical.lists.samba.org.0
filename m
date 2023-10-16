Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F077CB14C
	for <lists+samba-technical@lfdr.de>; Mon, 16 Oct 2023 19:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=AsBurwJXbB4R5awevx162dcbGLikXeWMaEzzvRwyTNk=; b=S8EkK4vRqMVueVVD/CI3QXG2UB
	Rx2uCjCJ4iRSdTeH3heE9hgKXf/J1FasJ+lZB0GDhusQr8lRqs1TaqifYqzdtc1DV1jVN+SfRMrhm
	NRHXfr8X3waQHaGJJaAG5jlxaMp/+6IqffVruSUIShNTL/ZPTiSPTluER0v/LrdmfcMsj7+q0g9SN
	RmCol6vhn6XqBnrWA+J4t/mUqw12tFKO8Pcfnk5MF1SJV8MsqsHY2WMuz7MKYGmDnw9WDB9vxcq8W
	iQb8dBrHlfRfAu6A2laiR3cTzkummIgNQs1KYp0q7w2S19PianRLJLy1nAccnPsC/imxX9/YeQuOD
	j/h9P4rQ==;
Received: from ip6-localhost ([::1]:27042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qsRMZ-000hUO-TB; Mon, 16 Oct 2023 17:26:43 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:59629) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qsRMT-000hUD-1e
 for samba-technical@lists.samba.org; Mon, 16 Oct 2023 17:26:40 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5041d6d8b10so6134647e87.2
 for <samba-technical@lists.samba.org>; Mon, 16 Oct 2023 10:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697477196; x=1698081996; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AsBurwJXbB4R5awevx162dcbGLikXeWMaEzzvRwyTNk=;
 b=STNqtcj++2Kx7/f0C/Iffx3EDg18dYQaD00XZYpfh4tRJpmohHRpauERPxFF0XE+vg
 zH8roj0zZxSe8lg700Fc7Wm9Hg/X2BTi3nVirN9BtnBPzC4M8GZlTxuJZzG2GsXx/sEX
 SFpMnhI47q2n1jl6G+qnMyzBPFMYNZLgR4Wk8v+COD7sefDaqX06yUpjhL2enMmfcyiI
 C3vdMqEksvHcr6rk012Fp8Uwu0lFYjWW6kchzRlDnHKFkVULk7sQs8IM/bSm315EVvf7
 wv7bImIiO9xlUB8Kwnws1w6jvftEy2YptbeOyQxiINnYuVw+E4KiSEbGukcPig96NCC5
 eqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697477196; x=1698081996;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AsBurwJXbB4R5awevx162dcbGLikXeWMaEzzvRwyTNk=;
 b=lckKCVtuW72YvOsjVaWUpPToQL5DPQJH6n7jCu1xyFkmzOaRRUBMjv10eNbh1S+PNm
 54cPxwG+XOxqPSlTXuo3AQnTGHm2lAiDBEnArVjns6PdQTmz2otD/z5m/WhopDwhvjm2
 iLlvyDrcUjZFKkG603eWVMr5eMcW2w4HmRMWYE+8iHp0pQjmi585dX2T70WQCMd8OKqE
 4h7j6F3nuBjDxWhdm2ZGjNA7fypEK7TLDN/pjcQE8AfESZRF7GE6KBOyANsQlcn8SEa8
 JRqr0djwAFVAHt4f6IyrPXIjf+4nmdxeXsNeOLu0SW26R690pJeh5R4vXwbq+n67Ktl5
 EBIQ==
X-Gm-Message-State: AOJu0Yz7bw/DEOaErTAniEc/qBRYCJtDqEow0XVmo+CTCU1SV6rx2bgO
 YU6A14978CLDsTcEaDgYyyQH8KlbhnxkyAZn7GvAzNLnFV3UNA==
X-Google-Smtp-Source: AGHT+IGgujqKyKcOrEpjXPQnPSTK+WOvMNi0lUfQFbpw2hAKHjQ6nShR1n4EuyDlQwMEWQOiKAkbAmPDk1YmkQTiPRg=
X-Received: by 2002:a2e:740e:0:b0:2c1:8a24:7afb with SMTP id
 p14-20020a2e740e000000b002c18a247afbmr29329503ljc.7.1697477195291; Mon, 16
 Oct 2023 10:26:35 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 16 Oct 2023 12:26:23 -0500
Message-ID: <CAH2r5mui-uk5XVnJMM2UQ40VJM5dyA=+YChGpDcLAapBTCk4kw@mail.gmail.com>
Subject: [PATCH][SMB3 client] fix touch -h of symlink
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000003d7e240607d8b5ee"
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000003d7e240607d8b5ee
Content-Type: text/plain; charset="UTF-8"

For example:
          touch -h -t 02011200 testfile
    where testfile is a symlink would not change the timestamp, but
          touch -t 02011200 testfile
    does work to change the timestamp of the target

Looks like some symlink inode operations are missing for other fs as well

-- 
Thanks,

Steve

--0000000000003d7e240607d8b5ee
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-smb3-fix-touch-h-of-symlink.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-fix-touch-h-of-symlink.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lnt62yk00>
X-Attachment-Id: f_lnt62yk00

RnJvbSA2YWY1ZjgzNWJhNDk4Nzk5NGFlY2JiYTBkN2MwNjAxNjBjODkyODU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgMTYgT2N0IDIwMjMgMTI6MTg6MjMgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBmaXggdG91Y2ggLWggb2Ygc3ltbGluawoKRm9yIGV4YW1wbGU6CiAgICAgIHRvdWNoIC1o
IC10IDAyMDExMjAwIHRlc3RmaWxlCndoZXJlIHRlc3RmaWxlIGlzIGEgc3ltbGluayB3b3VsZCBu
b3QgY2hhbmdlIHRoZSB0aW1lc3RhbXAsIGJ1dAogICAgICB0b3VjaCAtdCAwMjAxMTIwMCB0ZXN0
ZmlsZQpkb2VzIHdvcmsgdG8gY2hhbmdlIHRoZSB0aW1lc3RhbXAgb2YgdGhlIHRhcmdldAoKUmVw
b3J0ZWQtYnk6IE1pY2FoIFZlaWxsZXV4IDxtaWNhaC52ZWlsbGV1eEBpYmEtZ3JvdXAuY29tPgpD
bG9zZXM6IGh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xNDQ3NgpD
YzogU3RhYmxlIDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBG
cmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvc21iL2NsaWVudC9jaWZzZnMu
YyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZnMv
c21iL2NsaWVudC9jaWZzZnMuYyBiL2ZzL3NtYi9jbGllbnQvY2lmc2ZzLmMKaW5kZXggMjI4Njlj
ZGExMzU2Li5lYTNhN2E2NjhiNDUgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jbGllbnQvY2lmc2ZzLmMK
KysrIGIvZnMvc21iL2NsaWVudC9jaWZzZnMuYwpAQCAtMTE5MSw2ICsxMTkxLDcgQEAgY29uc3Qg
Y2hhciAqY2lmc19nZXRfbGluayhzdHJ1Y3QgZGVudHJ5ICpkZW50cnksIHN0cnVjdCBpbm9kZSAq
aW5vZGUsCiAKIGNvbnN0IHN0cnVjdCBpbm9kZV9vcGVyYXRpb25zIGNpZnNfc3ltbGlua19pbm9k
ZV9vcHMgPSB7CiAJLmdldF9saW5rID0gY2lmc19nZXRfbGluaywKKwkuc2V0YXR0ciA9IGNpZnNf
c2V0YXR0ciwKIAkucGVybWlzc2lvbiA9IGNpZnNfcGVybWlzc2lvbiwKIAkubGlzdHhhdHRyID0g
Y2lmc19saXN0eGF0dHIsCiB9OwotLSAKMi4zOS4yCgo=
--0000000000003d7e240607d8b5ee--

