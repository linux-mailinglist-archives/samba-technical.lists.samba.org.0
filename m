Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF5277D9C2
	for <lists+samba-technical@lfdr.de>; Wed, 16 Aug 2023 07:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oI9EbUbdFX+RrThKFfE8bckQkP7vk+YwcykLWlRyZmc=; b=wZSU/j3DDxlOz1PBQg/VodbYAF
	TOaVv+yeFVVAuF58RQH6/zvAhrbI3TYFaFqPfh8Tnzu3wqdTkoYuOIIGZFBG2MT2wOD3wmLACTYXU
	gJe2SLfAeBm3H7vzLRjho+suDVdSeWSYifb+pHstMQgJ/7CyttS7zUiSiIBUY4BCGOtNDMbeJ9cY+
	Cc5Ox557xpky0zmERTx1F29xrS30zCwlUNUIg1dz7fxQiyYm1sAKjOzFOl6yzFDi3wxnyWE5zoZJR
	u+2MGNYbnVp2j4PArRfcd1d9Wn0N56A21WkD+oWZ+g6AjWY3IboxyRYLlq4QNbDDhgJT8tT1YvHPM
	iskaa83Q==;
Received: from ip6-localhost ([::1]:27118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qW95Z-00CMJb-21; Wed, 16 Aug 2023 05:29:01 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:61910) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qW95R-00CMJS-I7
 for samba-technical@lists.samba.org; Wed, 16 Aug 2023 05:28:58 +0000
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52340d9187aso7988492a12.3
 for <samba-technical@lists.samba.org>; Tue, 15 Aug 2023 22:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692163729; x=1692768529;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oI9EbUbdFX+RrThKFfE8bckQkP7vk+YwcykLWlRyZmc=;
 b=pVHILuPrelt8olO6J3x6t/JNyuP+8amxy7PYit2QNk6GKT26n4acrJxjECq9+khi+n
 6r6y9zU8Y1KgZF3Pg/SLchBo04Ia9kd+/goffo1ag0frUlBD9WAehmnn8/Nk9uf8H0Op
 g5gVHsf2/RhSfwkfwgWF/rGKxyhlzJghbagqEm4yE5bAomBKCsP6FxJuYd1HwHQnFJgO
 kKW9o0qUVVy+ljmlqdYGjh31Z4XyuoDKQMP9hu5ILLFk9FOfMkCiZUy1yYzhSElHO9uR
 UeIqSDy4FzGyHCVDLLCRyF6aoqkq4v+9Ov1tw+uREDnUJybAqlXvOudp5JBvqJu1vQiu
 L4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692163729; x=1692768529;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oI9EbUbdFX+RrThKFfE8bckQkP7vk+YwcykLWlRyZmc=;
 b=OhYgIvQkFdBBofouG8tXPBCzKNTrUOkCgDc35KJbkUSdxO9l+IsGHA/1+KTCE4NW/v
 GgvYitZK8dE3GcDoGW2O2r3qX4KKcowfmc5xAmKMIxZwlST3o6JgD3m3jUIHukJBuJH5
 6klvDQmMAZdya6Eb0fHXe86mXEeipudW9POr5e9794415ghpejVthv1buhkv1ql9o9bU
 KDSCBi4Pd9eZfSc4oWCs2FXERoOIFtY6htrIeDVZmSu3H7AsAdPbuXu9IuKi6uiDTtu+
 bgH+9FRV0sws6A5WKHrA2Eni4DprIHN75b73WZs8MxnwA9w5UHyAfaJL/emPfaiK4kth
 r7Sw==
X-Gm-Message-State: AOJu0Yw/A68YR2B/KcIIbiVBpX6hjqp8qD9XjoEmEnOVkbpjNLtjz7tx
 dI5evN7m03XoTYyfvuTxJa5peKToJ/2UifcCVVs=
X-Google-Smtp-Source: AGHT+IHSF+TLanoCC/zz7iEYIVfKfhNYq8rVc5R2wapF465iYq1NHWQsc0WUGyq7xOotb7ciDMOqbS1Diw9kIuc+dZY=
X-Received: by 2002:a17:907:1de0:b0:99d:f2dc:97e3 with SMTP id
 og32-20020a1709071de000b0099df2dc97e3mr307243ejc.20.1692163728394; Tue, 15
 Aug 2023 22:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230815-fix-cifs-null-auth-v1-1-3cb785216d97@redhat.com>
 <2f7522c01a45f9052f423869040258ba.pc@manguebit.com>
In-Reply-To: <2f7522c01a45f9052f423869040258ba.pc@manguebit.com>
Date: Wed, 16 Aug 2023 00:28:36 -0500
Message-ID: <CAH2r5msYemdM+J_ETsrHOkxmm4qeDnA8cLYOHVA9LhfjoBnYuQ@mail.gmail.com>
Subject: Re: [PATCH] smb: client: fix null auth
To: Paulo Alcantara <pc@manguebit.com>
Content-Type: multipart/mixed; boundary="000000000000eee10a060303917c"
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
Cc: Scott Mayhew <smayhew@redhat.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000eee10a060303917c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixed some checkpatch warnings and added Paulo's RB, and updated
cifs-2.6.git for-next


On Tue, Aug 15, 2023 at 1:42=E2=80=AFPM Paulo Alcantara via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Scott Mayhew <smayhew@redhat.com> writes:
>
> > Commit abdb1742a312 removed code that clears ctx->username when
> > sec=3Dnone, so attempting to mount with '-o sec=3Dnone' now fails with
> > -EACCES.  Fix it by adding that logic to the parsing of the 'sec'
> > option, as well as checking if the mount is using null auth before
> > setting the username when parsing the 'user' option.
> >
> > Fixes: abdb1742a312 ("cifs: get rid of mount options string parsing")
> > Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> > ---
> >  fs/smb/client/fs_context.c | 4 ++++
> >  1 file changed, 4 insertions(+)
>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>
>


--=20
Thanks,

Steve

--000000000000eee10a060303917c
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-smb-client-fix-null-auth.patch"
Content-Disposition: attachment; 
	filename="0001-smb-client-fix-null-auth.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lldakw8n0>
X-Attachment-Id: f_lldakw8n0

RnJvbSAyNzBkNzNlNjUwN2Y5YzdmZmY0Mzg0NGQ3NGY4NjM2NWRmMDAwYjM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTY290dCBNYXloZXcgPHNtYXloZXdAcmVkaGF0LmNvbT4KRGF0
ZTogV2VkLCAxNiBBdWcgMjAyMyAwMDoyMzo1NiAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHNtYjog
Y2xpZW50OiBmaXggbnVsbCBhdXRoCgpDb21taXQgYWJkYjE3NDJhMzEyIHJlbW92ZWQgY29kZSB0
aGF0IGNsZWFycyBjdHgtPnVzZXJuYW1lIHdoZW4gc2VjPW5vbmUsIHNvIGF0dGVtcHRpbmcKdG8g
bW91bnQgd2l0aCAnLW8gc2VjPW5vbmUnIG5vdyBmYWlscyB3aXRoIC1FQUNDRVMuICBGaXggaXQg
YnkgYWRkaW5nIHRoYXQgbG9naWMgdG8gdGhlCnBhcnNpbmcgb2YgdGhlICdzZWMnIG9wdGlvbiwg
YXMgd2VsbCBhcyBjaGVja2luZyBpZiB0aGUgbW91bnQgaXMgdXNpbmcgbnVsbCBhdXRoIGJlZm9y
ZQpzZXR0aW5nIHRoZSB1c2VybmFtZSB3aGVuIHBhcnNpbmcgdGhlICd1c2VyJyBvcHRpb24uCgpG
aXhlczogYWJkYjE3NDJhMzEyICgiY2lmczogZ2V0IHJpZCBvZiBtb3VudCBvcHRpb25zIHN0cmlu
ZyBwYXJzaW5nIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogU2Nv
dHQgTWF5aGV3IDxzbWF5aGV3QHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBQYXVsbyBBbGNhbnRh
cmEgKFNVU0UpIDxwY0BtYW5ndWViaXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2gg
PHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvc21iL2NsaWVudC9mc19jb250ZXh0LmMg
fCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9m
cy9zbWIvY2xpZW50L2ZzX2NvbnRleHQuYyBiL2ZzL3NtYi9jbGllbnQvZnNfY29udGV4dC5jCmlu
ZGV4IDQ5NDZhMGM1OTYwMC4uNjdlMTZjMmFjOTBlIDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50
L2ZzX2NvbnRleHQuYworKysgYi9mcy9zbWIvY2xpZW50L2ZzX2NvbnRleHQuYwpAQCAtMjMxLDYg
KzIzMSw4IEBAIGNpZnNfcGFyc2Vfc2VjdXJpdHlfZmxhdm9ycyhzdHJ1Y3QgZnNfY29udGV4dCAq
ZmMsIGNoYXIgKnZhbHVlLCBzdHJ1Y3Qgc21iM19mc19jCiAJCWJyZWFrOwogCWNhc2UgT3B0X3Nl
Y19ub25lOgogCQljdHgtPm51bGxhdXRoID0gMTsKKwkJa2ZyZWUoY3R4LT51c2VybmFtZSk7CisJ
CWN0eC0+dXNlcm5hbWUgPSBOVUxMOwogCQlicmVhazsKIAlkZWZhdWx0OgogCQljaWZzX2Vycm9y
ZihmYywgImJhZCBzZWN1cml0eSBvcHRpb246ICVzXG4iLCB2YWx1ZSk7CkBAIC0xMjAxLDYgKzEy
MDMsOCBAQCBzdGF0aWMgaW50IHNtYjNfZnNfY29udGV4dF9wYXJzZV9wYXJhbShzdHJ1Y3QgZnNf
Y29udGV4dCAqZmMsCiAJY2FzZSBPcHRfdXNlcjoKIAkJa2ZyZWUoY3R4LT51c2VybmFtZSk7CiAJ
CWN0eC0+dXNlcm5hbWUgPSBOVUxMOworCQlpZiAoY3R4LT5udWxsYXV0aCkKKwkJCWJyZWFrOwog
CQlpZiAoc3RybGVuKHBhcmFtLT5zdHJpbmcpID09IDApIHsKIAkJCS8qIG51bGwgdXNlciwgaWUu
IGFub255bW91cyBhdXRoZW50aWNhdGlvbiAqLwogCQkJY3R4LT5udWxsYXV0aCA9IDE7Ci0tIAoy
LjM0LjEKCg==
--000000000000eee10a060303917c--

