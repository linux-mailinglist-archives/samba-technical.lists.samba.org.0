Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F38B1414A
	for <lists+samba-technical@lfdr.de>; Mon, 28 Jul 2025 19:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zjysJ+Wmx3VAfCQ/zZ7a9pBQD5yaulKDzspwdDkFPlQ=; b=vWZzYuHCLzTsVNhXu622nukdHY
	fU3o1uc/xKAkBlgwRaYuhbjf6vl0erTO76idy8c1NarGhkzt5hYUJEYjxs7K6h8lPThQ8Cxwv/jEM
	Ep/z/j7kNQkDg2hvQIH/14yBl4Q7ZMmUju3YgkN4LJlDxtJ4zNfmBFevShGiMAO5rgGc6+yHcNl+R
	M7X/pScU7y/mh5z7fdPx/pGdQ/dw2p/zxKm0Erg52dLUEmhXKl1TFxZuJIh0YwRjMyOJl/KIGT3TE
	6PdkgZYPAnMhvDiM6ChuWKFLeb8fwt+ouAMcrnY9Uw/sekO7eX9urMpqW3u0G7mHnaOF2Bnjh1J1l
	8rFmatyA==;
Received: from ip6-localhost ([::1]:21460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ugRn4-00BtUd-E4; Mon, 28 Jul 2025 17:37:34 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:45481) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ugRmz-00BtUW-A6
 for samba-technical@lists.samba.org; Mon, 28 Jul 2025 17:37:31 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6f8aa9e6ffdso42280156d6.3
 for <samba-technical@lists.samba.org>; Mon, 28 Jul 2025 10:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753724245; x=1754329045; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zjysJ+Wmx3VAfCQ/zZ7a9pBQD5yaulKDzspwdDkFPlQ=;
 b=RSKsC9MNJx70zMIqbcQKtVFGdeJNWOS1RHmNn17CBw28ghjiDeY2rg7ui/k0l15gih
 TDfu3jvDLqA+wUpXbJTeLVKaKbOzbGPMu4qwBal+TwTOXUYwbGXo2e1mLdDMX21A0a2H
 Qg+hsWVgmmTqMtCmHUfjf3Zjo9y6b5u5ECuE+Yru4W4Ym+kmk4NLFpxmzGR8BkFnFmbf
 YRy6BjPOZX6m97Ouc3srkSOK4T49IdBarwlPLfGiLAOs1IEhi+xgs2mXY2aguPRfjLlU
 j2TQLPysKWJlHhGr/sVzFHCkR4gh+C97+gzMmLg53ui+5IVKroDOzci9hLFfWjv3wIxi
 w/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753724245; x=1754329045;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zjysJ+Wmx3VAfCQ/zZ7a9pBQD5yaulKDzspwdDkFPlQ=;
 b=jm3Vqjlpoz1XAGTIkUs02six+1nUzT+ueIBU7Qtwq6xvhm1cDC+kiaKtwv4+LgPbYm
 uGumnnyYYHc0WEys+vBSpLIbUx31inIJuwD1+wIN0efHisxhORt2fJm0NcppBTQc3/WL
 MNHdimQb7KMRjoT/UGkWohj1bdI914ZkFnxBMUTCxmmxcmprv6qnQw9yPvzwEF/gPGGi
 m3ACQUitHGJ6jrsSt7/+Bw9vzLgS5ZOoB6/CNIPp170x0OmmOPGv0pVLBZCA8dIdQlVQ
 st5gyfYXdj9olRcXhcNBtQhfMlmIeOOWkNJYeKKIDm0YTES5L4HmR3cWQWVIm/b2wd/H
 pyPw==
X-Gm-Message-State: AOJu0Yx1Gf7FTwwLCO9/It2fZOe1du5EgAGk/Bq54FxgJM9f7kNRdXEo
 DbMPXRDxRgqI9TuE2Nvb6dZzyNx3hFlaSXAqzRrF5YtO7Ke7uvj/v2kblZ+RsPaXzrSVClK5NLV
 eguq4Okjxj3TD9oh+LoE1uDb52MKlxfY=
X-Gm-Gg: ASbGnct4yHWhQrAFCmraftZoXkDlB5PqzBZ/XbQIIWQp5Rvcyo43NHKkgBxLdpWclah
 lEFT2EoPdHWa7CH9kyXs6BBBZwepg5ydCukDjSiMyIWubYTAUcJh0LrMFiqhYMYbMxiF/DqTUib
 LWcCN+KtaB44XPshF7xJPjQPaKL0Tn7eHBQZNN7ha5NQk18Kz9akh+Di/k/EIeXJfEztfMjmi5O
 M37La/cBcnK1z7blkGk5sagF+1WC8p9R6K+X/oAug==
X-Google-Smtp-Source: AGHT+IGQOZmeIK6IGMsPsPBNZIEgWFjmp/cP1ww3qtTjGE1AOBsemK+elxYJD+GNAg3+2MO8REeYLl7CHbyZ6LjA6oc=
X-Received: by 2002:ad4:5de6:0:b0:704:f7d8:edfe with SMTP id
 6a1803df08f44-7072060de4emr157880136d6.51.1753724244810; Mon, 28 Jul 2025
 10:37:24 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 28 Jul 2025 12:37:13 -0500
X-Gm-Features: Ac12FXwP0oGDocTGq_crO4Gmi3J2T6jzzs0Fisac37meN_gLF9Bm4v4QepHDp_g
Message-ID: <CAH2r5msG+FxsTBot9RAz-tALK3S49nDpsfzigGTKaBaQtwheng@mail.gmail.com>
Subject: [PATCH][SMB3 client] add way to show directory leases for improved
 debugging
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000a5b637063b00be26"
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
Cc: Henrique Carvalho <henrique.carvalho@suse.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Bharath S M <bharathsm@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000a5b637063b00be26
Content-Type: text/plain; charset="UTF-8"

When looking at performance issues around directory caching, or debugging
directory lease issues, it is helpful to be able to display the current
directory leases (as we can e.g. or open files).  Create pseudo-file
/proc/fs/cifs/open_dirs that displays current directory leases.  Here
is sample output:

 cat /proc/fs/cifs/open_dirs
   Version:1
   Format:
   <tree id> <sess id> <persistent fid> <path>
  Num entries: 3
  0xce4c1c68 0x7176aa54 0xd95ef58e     \dira      valid file info, valid dirents
  0xce4c1c68 0x7176aa54 0xd031e211     \dir5      valid file info, valid dirents
  0xce4c1c68 0x7176aa54 0x96533a90     \dir1      valid file info

See attached patch
-- 
Thanks,

Steve

--000000000000a5b637063b00be26
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-client-add-way-to-show-directory-leases-for-imp.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-client-add-way-to-show-directory-leases-for-imp.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mdne4h0q0>
X-Attachment-Id: f_mdne4h0q0

RnJvbSA3OGQyMDI0Yzk2NzZlZDdkNTNkMmVkN2YyZWUyYTQ2MjYxYzBkNzYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgMjggSnVsIDIwMjUgMTI6MzI6NTMgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzIGNsaWVudDogYWRkIHdheSB0byBzaG93IGRpcmVjdG9yeSBsZWFzZXMgZm9yIGltcHJvdmVk
CiBkZWJ1Z2dpbmcKCldoZW4gbG9va2luZyBhdCBwZXJmb3JtYW5jZSBpc3N1ZXMgYXJvdW5kIGRp
cmVjdG9yeSBjYWNoaW5nLCBvciBkZWJ1Z2dpbmcKZGlyZWN0b3J5IGxlYXNlIGlzc3VlcywgaXQg
aXMgaGVscGZ1bCB0byBiZSBhYmxlIHRvIGRpc3BsYXkgdGhlIGN1cnJlbnQKZGlyZWN0b3J5IGxl
YXNlcyAoYXMgd2UgY2FuIGUuZy4gb3Igb3BlbiBmaWxlcykuICBDcmVhdGUgcHNldWRvLWZpbGUK
L3Byb2MvZnMvY2lmcy9vcGVuX2RpcnMgdGhhdCBkaXNwbGF5cyBjdXJyZW50IGRpcmVjdG9yeSBs
ZWFzZXMuICBIZXJlCmlzIHNhbXBsZSBvdXRwdXQ6CgpjYXQgL3Byb2MvZnMvY2lmcy9vcGVuX2Rp
cnMKIFZlcnNpb246MQogRm9ybWF0OgogPHRyZWUgaWQ+IDxzZXNzIGlkPiA8cGVyc2lzdGVudCBm
aWQ+IDxwYXRoPgpOdW0gZW50cmllczogMwoweGNlNGMxYzY4IDB4NzE3NmFhNTQgMHhkOTVlZjU4
ZSAgICAgXGRpcmEgICAgICB2YWxpZCBmaWxlIGluZm8sIHZhbGlkIGRpcmVudHMKMHhjZTRjMWM2
OCAweDcxNzZhYTU0IDB4ZDAzMWUyMTEgICAgIFxkaXI1ICAgICAgdmFsaWQgZmlsZSBpbmZvLCB2
YWxpZCBkaXJlbnRzCjB4Y2U0YzFjNjggMHg3MTc2YWE1NCAweDk2NTMzYTkwICAgICBcZGlyMSAg
ICAgIHZhbGlkIGZpbGUgaW5mbwoKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5j
aEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL3NtYi9jbGllbnQvY2FjaGVkX2Rpci5oIHwgIDEgLQog
ZnMvc21iL2NsaWVudC9jaWZzX2RlYnVnLmMgfCA1MyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9jYWNoZWRfZGlyLmggYi9mcy9zbWIv
Y2xpZW50L2NhY2hlZF9kaXIuaAppbmRleCAyYzI2Mjg4MWI3YjEuLjQ2YjVhMmZkZjE1YiAxMDA2
NDQKLS0tIGEvZnMvc21iL2NsaWVudC9jYWNoZWRfZGlyLmgKKysrIGIvZnMvc21iL2NsaWVudC9j
YWNoZWRfZGlyLmgKQEAgLTE0LDcgKzE0LDYgQEAgc3RydWN0IGNhY2hlZF9kaXJlbnQgewogCWNo
YXIgKm5hbWU7CiAJaW50IG5hbWVsZW47CiAJbG9mZl90IHBvczsKLQogCXN0cnVjdCBjaWZzX2Zh
dHRyIGZhdHRyOwogfTsKIApkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9jaWZzX2RlYnVnLmMg
Yi9mcy9zbWIvY2xpZW50L2NpZnNfZGVidWcuYwppbmRleCAzZmRmNzU3MzdkNDMuLmYxY2VhMzY1
YjZmMSAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9jaWZzX2RlYnVnLmMKKysrIGIvZnMvc21i
L2NsaWVudC9jaWZzX2RlYnVnLmMKQEAgLTI2LDYgKzI2LDcgQEAKICNpbmNsdWRlICJzbWJkaXJl
Y3QuaCIKICNlbmRpZgogI2luY2x1ZGUgImNpZnNfc3duLmgiCisjaW5jbHVkZSAiY2FjaGVkX2Rp
ci5oIgogCiB2b2lkCiBjaWZzX2R1bXBfbWVtKGNoYXIgKmxhYmVsLCB2b2lkICpkYXRhLCBpbnQg
bGVuZ3RoKQpAQCAtMjgwLDYgKzI4MSw1NCBAQCBzdGF0aWMgaW50IGNpZnNfZGVidWdfZmlsZXNf
cHJvY19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqdikKIAlyZXR1cm4gMDsKIH0KIAor
c3RhdGljIGludCBjaWZzX2RlYnVnX2RpcnNfcHJvY19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwg
dm9pZCAqdikKK3sKKwlzdHJ1Y3QgbGlzdF9oZWFkICpzdG1wLCAqdG1wLCAqdG1wMTsKKwlzdHJ1
Y3QgVENQX1NlcnZlcl9JbmZvICpzZXJ2ZXI7CisJc3RydWN0IGNpZnNfc2VzICpzZXM7CisJc3Ry
dWN0IGNpZnNfdGNvbiAqdGNvbjsKKwlzdHJ1Y3QgY2FjaGVkX2ZpZHMgKmNmaWRzOworCXN0cnVj
dCBjYWNoZWRfZmlkICpjZmlkOworCUxJU1RfSEVBRChlbnRyeSk7CisKKwlzZXFfcHV0cyhtLCAi
IyBWZXJzaW9uOjFcbiIpOworCXNlcV9wdXRzKG0sICIjIEZvcm1hdDpcbiIpOworCXNlcV9wdXRz
KG0sICIjIDx0cmVlIGlkPiA8c2VzcyBpZD4gPHBlcnNpc3RlbnQgZmlkPiA8cGF0aD5cbiIpOwor
CisJc3Bpbl9sb2NrKCZjaWZzX3RjcF9zZXNfbG9jayk7CisJbGlzdF9mb3JfZWFjaChzdG1wLCAm
Y2lmc190Y3Bfc2VzX2xpc3QpIHsKKwkJc2VydmVyID0gbGlzdF9lbnRyeShzdG1wLCBzdHJ1Y3Qg
VENQX1NlcnZlcl9JbmZvLAorCQkJCSAgICB0Y3Bfc2VzX2xpc3QpOworCQlsaXN0X2Zvcl9lYWNo
KHRtcCwgJnNlcnZlci0+c21iX3Nlc19saXN0KSB7CisJCQlzZXMgPSBsaXN0X2VudHJ5KHRtcCwg
c3RydWN0IGNpZnNfc2VzLCBzbWJfc2VzX2xpc3QpOworCQkJbGlzdF9mb3JfZWFjaCh0bXAxLCAm
c2VzLT50Y29uX2xpc3QpIHsKKwkJCQl0Y29uID0gbGlzdF9lbnRyeSh0bXAxLCBzdHJ1Y3QgY2lm
c190Y29uLCB0Y29uX2xpc3QpOworCQkJCWNmaWRzID0gdGNvbi0+Y2ZpZHM7CisJCQkJc3Bpbl9s
b2NrKCZjZmlkcy0+Y2ZpZF9saXN0X2xvY2spOyAvKiBjaGVjayBsb2NrIG9yZGVyaW5nICovCisJ
CQkJc2VxX3ByaW50ZihtLCAiTnVtIGVudHJpZXM6ICVkXG4iLCBjZmlkcy0+bnVtX2VudHJpZXMp
OworCQkJCWxpc3RfZm9yX2VhY2hfZW50cnkoY2ZpZCwgJmNmaWRzLT5lbnRyaWVzLCBlbnRyeSkg
eworCQkJCQlzZXFfcHJpbnRmKG0sICIweCV4IDB4JWxseCAweCVsbHggICAgICVzIiwKKwkJCQkJ
CXRjb24tPnRpZCwKKwkJCQkJCXNlcy0+U3VpZCwKKwkJCQkJCWNmaWQtPmZpZC5wZXJzaXN0ZW50
X2ZpZCwKKwkJCQkJCWNmaWQtPnBhdGgpOworCQkJCQlpZiAoY2ZpZC0+ZmlsZV9hbGxfaW5mb19p
c192YWxpZCkKKwkJCQkJCXNlcV9wcmludGYobSwgIlx0dmFsaWQgZmlsZSBpbmZvIik7CisJCQkJ
CWlmIChjZmlkLT5kaXJlbnRzLmlzX3ZhbGlkKQorCQkJCQkJc2VxX3ByaW50ZihtLCAiLCB2YWxp
ZCBkaXJlbnRzIik7CisJCQkJCXNlcV9wcmludGYobSwgIlxuIik7CisJCQkJfQorCQkJCXNwaW5f
dW5sb2NrKCZjZmlkcy0+Y2ZpZF9saXN0X2xvY2spOworCisKKwkJCX0KKwkJfQorCX0KKwlzcGlu
X3VubG9jaygmY2lmc190Y3Bfc2VzX2xvY2spOworCXNlcV9wdXRjKG0sICdcbicpOworCXJldHVy
biAwOworfQorCiBzdGF0aWMgX19hbHdheXNfaW5saW5lIGNvbnN0IGNoYXIgKmNvbXByZXNzaW9u
X2FsZ19zdHIoX19sZTE2IGFsZykKIHsKIAlzd2l0Y2ggKGFsZykgewpAQCAtODYzLDYgKzkxMiw5
IEBAIGNpZnNfcHJvY19pbml0KHZvaWQpCiAJcHJvY19jcmVhdGVfc2luZ2xlKCJvcGVuX2ZpbGVz
IiwgMDQwMCwgcHJvY19mc19jaWZzLAogCQkJY2lmc19kZWJ1Z19maWxlc19wcm9jX3Nob3cpOwog
CisJcHJvY19jcmVhdGVfc2luZ2xlKCJvcGVuX2RpcnMiLCAwNDAwLCBwcm9jX2ZzX2NpZnMsCisJ
CQljaWZzX2RlYnVnX2RpcnNfcHJvY19zaG93KTsKKwogCXByb2NfY3JlYXRlKCJTdGF0cyIsIDA2
NDQsIHByb2NfZnNfY2lmcywgJmNpZnNfc3RhdHNfcHJvY19vcHMpOwogCXByb2NfY3JlYXRlKCJj
aWZzRllJIiwgMDY0NCwgcHJvY19mc19jaWZzLCAmY2lmc0ZZSV9wcm9jX29wcyk7CiAJcHJvY19j
cmVhdGUoInRyYWNlU01CIiwgMDY0NCwgcHJvY19mc19jaWZzLCAmdHJhY2VTTUJfcHJvY19vcHMp
OwpAQCAtOTA3LDYgKzk1OSw3IEBAIGNpZnNfcHJvY19jbGVhbih2b2lkKQogCiAJcmVtb3ZlX3By
b2NfZW50cnkoIkRlYnVnRGF0YSIsIHByb2NfZnNfY2lmcyk7CiAJcmVtb3ZlX3Byb2NfZW50cnko
Im9wZW5fZmlsZXMiLCBwcm9jX2ZzX2NpZnMpOworCXJlbW92ZV9wcm9jX2VudHJ5KCJvcGVuX2Rp
cnMiLCBwcm9jX2ZzX2NpZnMpOwogCXJlbW92ZV9wcm9jX2VudHJ5KCJjaWZzRllJIiwgcHJvY19m
c19jaWZzKTsKIAlyZW1vdmVfcHJvY19lbnRyeSgidHJhY2VTTUIiLCBwcm9jX2ZzX2NpZnMpOwog
CXJlbW92ZV9wcm9jX2VudHJ5KCJTdGF0cyIsIHByb2NfZnNfY2lmcyk7Ci0tIAoyLjQzLjAKCg==
--000000000000a5b637063b00be26--

