Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C48599EB
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 00:00:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PJStQiGaJ+jH9PubL79gJDxuqbSjwZnORRggih+N8+s=; b=o8cmPpUi8y4edklXUT3G6GCCDg
	HAiBF2eJLTkvAwMgV3sPn5saFcXSceaWUxhSvsep5SoeDqxLPu2zdrntkbgLm1nMlWwpex7MxVX+g
	X7uYttWW74QH5U7tTjkMzEEBNU+8Wuag7d0/ZgiisyDS4BQHRGTc0d1faOw2VnQ+O2V/x1MROJkw1
	/AwN/4fSkbCXb6PX0aYqwKAK09EEC2+k+MFpQfZYDUCWibkgC/wx5ZfUYB1f2qDwHjEzLwwbjE9JJ
	wmLclsC3VXyYvqE351tVakbL3Ty+WH7fb638XPYnXjj313HEz4YsBs2po4P7+Rq+5krwXNFt3Z7ad
	rXZKv5EQ==;
Received: from ip6-localhost ([::1]:36760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rbq7y-008r4C-95; Sun, 18 Feb 2024 22:59:18 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:49288) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rbq7t-008r45-QT
 for samba-technical@lists.samba.org; Sun, 18 Feb 2024 22:59:16 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d22d0f8ad1so11883961fa.2
 for <samba-technical@lists.samba.org>; Sun, 18 Feb 2024 14:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708297152; x=1708901952; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PJStQiGaJ+jH9PubL79gJDxuqbSjwZnORRggih+N8+s=;
 b=meuB+QF+LSgU7161nW5unS1VpOPs5ODvERiD8wrVrLjxROPO9pQ53udugz652L5x6/
 Ot7ROZ0QaygLenTNuKS1Ry3DUCXLJXgVc+XtVp6yeSc0itvk1K18/HL2eQir+DZvcZp4
 eSI92mmvUxBJz+fjL0ksygcsdh34qf9555ZShPHiZqMUf9bEygHgmfpmwWg5m/Ve4MUa
 npj771lrzvlRPA4ie4KJlyxbdL2THbNhDG4XOY9Rs2aaH2xO29Cq5M/zZcNuZciCmWBx
 O5q0g1VZjeeDAzGaAGgtznTbKCsNd5gj+w2XO+RVXDlKdywR87ylBYiooX01ZfyRKTAH
 eizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708297152; x=1708901952;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PJStQiGaJ+jH9PubL79gJDxuqbSjwZnORRggih+N8+s=;
 b=lL6gnsyOXm4RXcpl6Tn7831BlKBvXiL1r1po9Z6Ut7RaInvuXaavwmG37Q756ReeiS
 5fQwGkmCDgoGEytOKVrT7OdAkZlv9RP/K/P2uL/cOrOMklqo/p1K505DIQ1WxHY6jSEI
 ZrfvHD3ueYGIP8RIzi0FyE5QxtpLAzXVVL5AfjKQI8Tb+C7lbqgQ6O3LzXQExAHfHRq9
 Ml1Oc0c97cSnyM+OuKqspTCwiSyr/7MV9Ajrs887wTzr4Ydow/dbnnyMjyf7bCgVqG2e
 z9by0+R2wwqDaH2YJGm8QVyx3Utrz7yakNpry31we/A6jfQLu7oIASwv/2oMF/fv2Sw0
 OukA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVb8TX57HA49LP2NAF/jlVLezaGnM24Gzr9ppsWS+y3080Il2wFiGrKYjJr8AkM7HKokdMmgRwMnXmrnud/pWz/V9KhqJic7LPRo2VnPr1
X-Gm-Message-State: AOJu0YylQbuCrNNr3VMmShkgePtEERSaz4QJ9yY0z/fNalZybF28ItGF
 7Fq23WcjuswE6+yJt67ua2gzZXoCcMKk9sWsze3gD0z8gWR4JXrJn9L8/TD0wwVixfqKZ1jmcI1
 LnfqdMOanIiQO3Ffx8b/gc5CprC8=
X-Google-Smtp-Source: AGHT+IE9B3DeA/q8nwkc6xTaYIVZt6lFyTmxu/9gjnK6Vr+shYELPkszBDeGP7XTy1PHWnm42bQusXJqylXoxtkqtvQ=
X-Received: by 2002:a05:6512:242:b0:511:75a7:1513 with SMTP id
 b2-20020a056512024200b0051175a71513mr6622525lfo.67.1708297152228; Sun, 18 Feb
 2024 14:59:12 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mtUnLDtwbW7or=Uc+AXkzLpHsJoPuoLE7yyjPVYjvZCow@mail.gmail.com>
 <CANT5p=oNRF9BAgybCX7dE+KvYj=k2G3tERa+fMJOY6tsuZ00Hw@mail.gmail.com>
 <bc2eaf5b9eafe2134820d1ea8c07e43f@manguebit.com>
In-Reply-To: <bc2eaf5b9eafe2134820d1ea8c07e43f@manguebit.com>
Date: Sun, 18 Feb 2024 16:59:00 -0600
Message-ID: <CAH2r5mtSB0nDKxAJHtnp6USgoeVN7hNF79NaOcX_pnF5MVPFhA@mail.gmail.com>
Subject: Re: [WIP PATCH] allow changing the password on remount in some cases
To: Paulo Alcantara <pc@manguebit.com>
Content-Type: multipart/mixed; boundary="000000000000ee07a90611afec49"
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>, Bharath S M <bharathsm@microsoft.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000ee07a90611afec49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Updated the patch to allow remount to only change the password if
disconnected and the session fails to reconnect due to continued
access denied or password expired errors.

Any thoughts on whether I should add another patch to throttle
repeated session setups after access denied or key expired (currently
looks like repeated every few seconds) maybe double the time
repeatedly (e.g. until a max of 10 or 20 or 30 seconds? between
reconnect attempts) instead of every two seconds.

On Fri, Feb 16, 2024 at 8:41=E2=80=AFAM Paulo Alcantara <pc@manguebit.com> =
wrote:
>
> Shyam Prasad N <nspmangalore@gmail.com> writes:
>
> > need_recon would also be true in other cases, for example when the
> > network is temporarily disconnected. This patch will allow changing of
> > password even then.
> > We could setup a special flag when the server returns a
> > STATUS_LOGON_FAILURE for SessionSetup. We can make the check for that
> > flag and then allow password change on remount.
>
> Yes.  Allowing password change over remount simply because network is
> disconnected is not a good idea.  The user could mistype the password
> when performing a remount and then everything would stop working.
>
> Not to mention that this patch is only handling a specfic case where a
> mount would have a single SMB session, which isn't true for a DFS mount.
>
> > Another option is to extend the multiuser keyring mechanism for single
> > user use case as well, and use that for password update.
> > Ideally, we should be able to setup multiple passwords in that keyring
> > and iterate through them once to see if SessionSetup goes through.
>
> Yes, sounds like the best approach so far.  It would allow users to
> update their passwords in keyring and sysadmins could drop existing SMB
> sessions from server side and then the client would reconnect by using
> new password from keyring.  This wouldn't even require a remount.
>
> Besides, marking this for -stable makes no sense.



--=20
Thanks,

Steve

--000000000000ee07a90611afec49
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-allow-changing-password-during-remount.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-allow-changing-password-during-remount.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lss3y42n0>
X-Attachment-Id: f_lss3y42n0

RnJvbSAwYWIwYTVmZWQ0NzYzNGNlZjJhNDliODBhMzUxOTc4ODBhYTk2NjU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMTMgRmViIDIwMjQgMDA6NDA6MDEgLTA2MDAKU3ViamVjdDogW1BBVENIXSBj
aWZzOiBhbGxvdyBjaGFuZ2luZyBwYXNzd29yZCBkdXJpbmcgcmVtb3VudAoKVGhlcmUgYXJlIGNh
c2VzIHdoZXJlIGEgc2Vzc2lvbiBpcyBkaXNjb25uZWN0ZWQgYW5kIHBhc3N3b3JkIGhhcyBjaGFu
Z2VkCm9uIHRoZSBzZXJ2ZXIgKG9yIGV4cGlyZWQpIGZvciB0aGlzIHVzZXIgYW5kIHRoaXMgY3Vy
cmVudGx5IGNhbiBub3QKYmUgZml4ZWQgd2l0aG91dCB1bm1vdW50IGFuZCBtb3VudGluZyBhZ2Fp
bi4gIFRoaXMgcGF0Y2ggYWxsb3dzCnJlbW91bnQgdG8gY2hhbmdlIHRoZSBwYXNzd29yZCB3aGVu
IHRoZSBzZXNzaW9uIGlzIGRpc2Nvbm5lY3RlZAphbmQgdGhlIHVzZXIgY2FuIG5vdCByZWNvbm5l
Y3QgZHVlIHRvIHN0aWxsIHVzaW5nIG9sZCBwYXNzd29yZC4KCkZ1dHVyZSBwYXRjaGVzIHNob3Vs
ZCBhbHNvIGFsbG93IHVzIHRvIHNldHVwIHRoZSBrZXlyaW5nIChjaWZzY3JlZHMpCnRvIGhhdmUg
YW4gImFsdGVybmF0ZSBwYXNzd29yZCIgc28gd2Ugd291bGQgYmUgYWJsZSB0byBjaGFuZ2UKdGhl
IHBhc3N3b3JkIGJlZm9yZSB0aGUgc2Vzc2lvbiBkcm9wcyAod2l0aG91dCB0aGUgcmlzayBvZiBy
YWNlcwpiZXR3ZWVuIHdoZW4gdGhlIHBhc3N3b3JkIGNoYW5nZXMgYW5kIHRoZSBkaXNjb25uZWN0
IG9jY3VycyAtCmllIGNhc2VzIHdoZXJlIHRoZSBvbGQgcGFzc3dvcmQgaXMgc3RpbGwgbmVlZGVk
IGJlY2F1c2UgdGhlIG5ldwpwYXNzd29yZCBoYXMgbm90IGZ1bGx5IHJvbGxlZCBvdXQgdG8gYWxs
IHNlcnZlcnMgeWV0KS4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6
IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50
L2NpZnNfZGVidWcuYyB8ICAyICsrCiBmcy9zbWIvY2xpZW50L2NpZnNnbG9iLmggICB8ICAxICsK
IGZzL3NtYi9jbGllbnQvZnNfY29udGV4dC5jIHwgMjMgKysrKysrKysrKysrKysrKysrLS0tLS0K
IGZzL3NtYi9jbGllbnQvc21iMnBkdS5jICAgIHwgIDUgKysrKysKIDQgZmlsZXMgY2hhbmdlZCwg
MjYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xp
ZW50L2NpZnNfZGVidWcuYyBiL2ZzL3NtYi9jbGllbnQvY2lmc19kZWJ1Zy5jCmluZGV4IDNlNDIw
OWY0MWMxOC4uMjNkMjYyMmI5NjlmIDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L2NpZnNfZGVi
dWcuYworKysgYi9mcy9zbWIvY2xpZW50L2NpZnNfZGVidWcuYwpAQCAtNDg4LDYgKzQ4OCw4IEBA
IHN0YXRpYyBpbnQgY2lmc19kZWJ1Z19kYXRhX3Byb2Nfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0s
IHZvaWQgKnYpCiAJCQkJc2VzLT5zZXNfY291bnQsIHNlcy0+c2VydmVyT1MsIHNlcy0+c2VydmVy
Tk9TLAogCQkJCXNlcy0+Y2FwYWJpbGl0aWVzLCBzZXMtPnNlc19zdGF0dXMpOwogCQkJfQorCQkJ
aWYgKHNlcy0+ZXhwaXJlZF9wd2QpCisJCQkJc2VxX3B1dHMobSwgInBhc3N3b3JkIG5vIGxvbmdl
ciB2YWxpZCAiKTsKIAkJCXNwaW5fdW5sb2NrKCZzZXMtPnNlc19sb2NrKTsKIAogCQkJc2VxX3By
aW50ZihtLCAiXG5cdFNlY3VyaXR5IHR5cGU6ICVzICIsCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xp
ZW50L2NpZnNnbG9iLmggYi9mcy9zbWIvY2xpZW50L2NpZnNnbG9iLmgKaW5kZXggNTNjNzVjZmIz
M2FiLi5lYzlhMjZiZDA1YTEgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jbGllbnQvY2lmc2dsb2IuaAor
KysgYi9mcy9zbWIvY2xpZW50L2NpZnNnbG9iLmgKQEAgLTEwNjYsNiArMTA2Niw3IEBAIHN0cnVj
dCBjaWZzX3NlcyB7CiAJZW51bSBzZWN1cml0eUVudW0gc2VjdHlwZTsgLyogd2hhdCBzZWN1cml0
eSBmbGF2b3Igd2FzIHNwZWNpZmllZD8gKi8KIAlib29sIHNpZ247CQkvKiBpcyBzaWduaW5nIHJl
cXVpcmVkPyAqLwogCWJvb2wgZG9tYWluQXV0bzoxOworCWJvb2wgZXhwaXJlZF9wd2Q7ICAvKiB0
cmFjayBpZiBhY2Nlc3MgZGVuaWVkIG9yIGV4cGlyZWQgcHdkIHNvIGNhbiBrbm93IGlmIG5lZWQg
dG8gdXBkYXRlICovCiAJdW5zaWduZWQgaW50IGZsYWdzOwogCV9fdTE2IHNlc3Npb25fZmxhZ3M7
CiAJX191OCBzbWIzc2lnbmluZ2tleVtTTUIzX1NJR05fS0VZX1NJWkVdOwpkaWZmIC0tZ2l0IGEv
ZnMvc21iL2NsaWVudC9mc19jb250ZXh0LmMgYi9mcy9zbWIvY2xpZW50L2ZzX2NvbnRleHQuYwpp
bmRleCA0YjJmNWFhMmVhMGUuLjk5NzAyYWIwNWY4ZCAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVu
dC9mc19jb250ZXh0LmMKKysrIGIvZnMvc21iL2NsaWVudC9mc19jb250ZXh0LmMKQEAgLTc3Miw3
ICs3NzIsNyBAQCBzdGF0aWMgdm9pZCBzbWIzX2ZzX2NvbnRleHRfZnJlZShzdHJ1Y3QgZnNfY29u
dGV4dCAqZmMpCiAgKi8KIHN0YXRpYyBpbnQgc21iM192ZXJpZnlfcmVjb25maWd1cmVfY3R4KHN0
cnVjdCBmc19jb250ZXh0ICpmYywKIAkJCQkgICAgICAgc3RydWN0IHNtYjNfZnNfY29udGV4dCAq
bmV3X2N0eCwKLQkJCQkgICAgICAgc3RydWN0IHNtYjNfZnNfY29udGV4dCAqb2xkX2N0eCkKKwkJ
CQkgICAgICAgc3RydWN0IHNtYjNfZnNfY29udGV4dCAqb2xkX2N0eCwgYm9vbCBuZWVkX3JlY29u
KQogewogCWlmIChuZXdfY3R4LT5wb3NpeF9wYXRocyAhPSBvbGRfY3R4LT5wb3NpeF9wYXRocykg
ewogCQljaWZzX2Vycm9yZihmYywgImNhbiBub3QgY2hhbmdlIHBvc2l4cGF0aHMgZHVyaW5nIHJl
bW91bnRcbiIpOwpAQCAtNzk4LDggKzc5OCwxMSBAQCBzdGF0aWMgaW50IHNtYjNfdmVyaWZ5X3Jl
Y29uZmlndXJlX2N0eChzdHJ1Y3QgZnNfY29udGV4dCAqZmMsCiAJfQogCWlmIChuZXdfY3R4LT5w
YXNzd29yZCAmJgogCSAgICAoIW9sZF9jdHgtPnBhc3N3b3JkIHx8IHN0cmNtcChuZXdfY3R4LT5w
YXNzd29yZCwgb2xkX2N0eC0+cGFzc3dvcmQpKSkgewotCQljaWZzX2Vycm9yZihmYywgImNhbiBu
b3QgY2hhbmdlIHBhc3N3b3JkIGR1cmluZyByZW1vdW50XG4iKTsKLQkJcmV0dXJuIC1FSU5WQUw7
CisJCWlmIChuZWVkX3JlY29uID09IGZhbHNlKSB7CisJCQljaWZzX2Vycm9yZihmYywKKwkJCQkg
ICAgImNhbiBub3QgY2hhbmdlIHBhc3N3b3JkIG9mIGFjdGl2ZSBzZXNzaW9uIGR1cmluZyByZW1v
dW50XG4iKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CiAJfQogCWlmIChuZXdfY3R4LT5kb21h
aW5uYW1lICYmCiAJICAgICghb2xkX2N0eC0+ZG9tYWlubmFtZSB8fCBzdHJjbXAobmV3X2N0eC0+
ZG9tYWlubmFtZSwgb2xkX2N0eC0+ZG9tYWlubmFtZSkpKSB7CkBAIC04NDMsOSArODQ2LDE0IEBA
IHN0YXRpYyBpbnQgc21iM19yZWNvbmZpZ3VyZShzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCiAJc3Ry
dWN0IHNtYjNfZnNfY29udGV4dCAqY3R4ID0gc21iM19mYzJjb250ZXh0KGZjKTsKIAlzdHJ1Y3Qg
ZGVudHJ5ICpyb290ID0gZmMtPnJvb3Q7CiAJc3RydWN0IGNpZnNfc2JfaW5mbyAqY2lmc19zYiA9
IENJRlNfU0Iocm9vdC0+ZF9zYik7CisJc3RydWN0IGNpZnNfc2VzICpzZXMgPSBjaWZzX3NiX21h
c3Rlcl90Y29uKGNpZnNfc2IpLT5zZXM7CisJYm9vbCBuZWVkX3JlY29uID0gZmFsc2U7CiAJaW50
IHJjOwogCi0JcmMgPSBzbWIzX3ZlcmlmeV9yZWNvbmZpZ3VyZV9jdHgoZmMsIGN0eCwgY2lmc19z
Yi0+Y3R4KTsKKwlpZiAoc2VzLT5leHBpcmVkX3B3ZCkKKwkJbmVlZF9yZWNvbiA9IHRydWU7CisK
KwlyYyA9IHNtYjNfdmVyaWZ5X3JlY29uZmlndXJlX2N0eChmYywgY3R4LCBjaWZzX3NiLT5jdHgs
IG5lZWRfcmVjb24pOwogCWlmIChyYykKIAkJcmV0dXJuIHJjOwogCkBAIC04NTgsNyArODY2LDEy
IEBAIHN0YXRpYyBpbnQgc21iM19yZWNvbmZpZ3VyZShzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCiAJ
U1RFQUxfU1RSSU5HKGNpZnNfc2IsIGN0eCwgVU5DKTsKIAlTVEVBTF9TVFJJTkcoY2lmc19zYiwg
Y3R4LCBzb3VyY2UpOwogCVNURUFMX1NUUklORyhjaWZzX3NiLCBjdHgsIHVzZXJuYW1lKTsKLQlT
VEVBTF9TVFJJTkdfU0VOU0lUSVZFKGNpZnNfc2IsIGN0eCwgcGFzc3dvcmQpOworCWlmIChuZWVk
X3JlY29uID09IGZhbHNlKQorCQlTVEVBTF9TVFJJTkdfU0VOU0lUSVZFKGNpZnNfc2IsIGN0eCwg
cGFzc3dvcmQpOworCWVsc2UgIHsKKwkJa2ZyZWVfc2Vuc2l0aXZlKHNlcy0+cGFzc3dvcmQpOwor
CQlzZXMtPnBhc3N3b3JkID0ga3N0cmR1cChjdHgtPnBhc3N3b3JkLCBHRlBfS0VSTkVMKTsKKwl9
CiAJU1RFQUxfU1RSSU5HKGNpZnNfc2IsIGN0eCwgZG9tYWlubmFtZSk7CiAJU1RFQUxfU1RSSU5H
KGNpZnNfc2IsIGN0eCwgbm9kZW5hbWUpOwogCVNURUFMX1NUUklORyhjaWZzX3NiLCBjdHgsIGlv
Y2hhcnNldCk7CmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L3NtYjJwZHUuYyBiL2ZzL3NtYi9j
bGllbnQvc21iMnBkdS5jCmluZGV4IDYwOGVlMDU0OTFlMi4uYTUwMDM4MGQxYjJlIDEwMDY0NAot
LS0gYS9mcy9zbWIvY2xpZW50L3NtYjJwZHUuYworKysgYi9mcy9zbWIvY2xpZW50L3NtYjJwZHUu
YwpAQCAtMTUzNiw2ICsxNTM2LDExIEBAIFNNQjJfc2Vzc19zZW5kcmVjZWl2ZShzdHJ1Y3QgU01C
Ml9zZXNzX2RhdGEgKnNlc3NfZGF0YSkKIAkJCSAgICAmc2Vzc19kYXRhLT5idWYwX3R5cGUsCiAJ
CQkgICAgQ0lGU19MT0dfRVJST1IgfCBDSUZTX1NFU1NfT1AsICZyc3BfaW92KTsKIAljaWZzX3Nt
YWxsX2J1Zl9yZWxlYXNlKHNlc3NfZGF0YS0+aW92WzBdLmlvdl9iYXNlKTsKKwlpZiAocmMgPT0g
MCkKKwkJc2Vzc19kYXRhLT5zZXMtPmV4cGlyZWRfcHdkID0gZmFsc2U7CisJZWxzZSBpZiAoKHJj
ID09IC1FQUNDRVMpIHx8IChyYyA9PSAtRUtFWUVYUElSRUQpIHx8IChyYyA9PSAtRUtFWVJFVk9L
RUQpKQorCQlzZXNzX2RhdGEtPnNlcy0+ZXhwaXJlZF9wd2QgPSB0cnVlOworCiAJbWVtY3B5KCZz
ZXNzX2RhdGEtPmlvdlswXSwgJnJzcF9pb3YsIHNpemVvZihzdHJ1Y3Qga3ZlYykpOwogCiAJcmV0
dXJuIHJjOwotLSAKMi40MC4xCgo=
--000000000000ee07a90611afec49--

