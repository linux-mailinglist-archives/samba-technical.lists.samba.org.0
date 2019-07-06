Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7B560F30
	for <lists+samba-technical@lfdr.de>; Sat,  6 Jul 2019 08:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=IFrctn3G5hJQKPOD5ymme59A3yIl5LKicKYiHLn37OU=; b=5NhQO/aT4ZjeFEg9ZdYJli+hgD
	QXzETdDT+Uv1OdjmHXrvaTF7Ga121+ZZKeGo1O9pEDASKRU2q5VyhVSMb3QTKFwoDt2MMNIWYKLxV
	pKUvZf6AkOq+oNzJbXA6D9USaG21iohL27VEacFbq/LF+rA+gACf4JXiUAGfa4RN58HPLjKZpBdfS
	+c8/GAMmfpSFEhCjAeqf135v3FO5IukQRuZvIuWbLWNeyHQF9WdoYrV3L0NaVd2pYhJM2TOfat50+
	KDgUHB9M9/o+j0zQiucK/nHW8J73kHqTsO+536/ceuW/i+S/7Ys492sI8vLXVCvgv4AV1v7Dth8SS
	Papsk7Dg==;
Received: from localhost ([::1]:48526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjdxb-005bCI-CG; Sat, 06 Jul 2019 06:14:11 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40881) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjdxV-005bCB-Om
 for samba-technical@lists.samba.org; Sat, 06 Jul 2019 06:14:08 +0000
Received: by mail-pl1-x642.google.com with SMTP id a93so5562104pla.7
 for <samba-technical@lists.samba.org>; Fri, 05 Jul 2019 23:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=IFrctn3G5hJQKPOD5ymme59A3yIl5LKicKYiHLn37OU=;
 b=Jy5hvf04AqlXFIFTPNzg9OOMovTLDJuh17ZkaJRRP/BlHjVwvaPEjvv5xgcvhRGolD
 wexsgQpsePkj5xHYm9B7jqv+0vZ3GQRAbnwbhFdTcsa7uWHK+a2cv/BvkZg0vo4nPyDB
 zqN395GjG69FCRI+6kM/HmS78DWcKjgBEzTD0a+5QKTHK1Yx4g88Rv/0bcvuaR4eZtF7
 qSa848UwOTWxCEma4Ts8zIalVHBfVjugdzqQ/9TmWmVDF910ntQ6wmbYuHUA2lW9Hn+V
 S/YrN4PcSnxVpp27E8hTb8f/ZolONIglI8wAcsnnQ16cH3CYwawOob6sGpiZITtnH2RM
 K2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=IFrctn3G5hJQKPOD5ymme59A3yIl5LKicKYiHLn37OU=;
 b=TqhUBJ9/YFrMBo7OoC01y0NyvIl6gPSpet+2v2Md8BeCMcyCBv6yy5JkC3arrP9IT6
 +Rw2UrOsBRdT3X8zdvcy0icPsPkwpAIS8tf8LaoY1OAyLjl9NvamWf4/Ye45TCmIGo1r
 BuN3XSBIQZt//rGOsA/27jU/0C0A+c2B7fIgn122CaS0dyQIalQVg1Ow8f2Jc67rghEf
 iFwfXl8Rkk+WKCQ1I7nYeuw8jWVK2YhSPrJsX3cQBPH0UmU21hPbqppcQQ2gDBwUIXuG
 3kBxdMPJpFeyENZzVc+cLh5M8J4UEYqb1IWlsNuYXW9AgC1bSFXAKCpqZjnNPvVsyEUh
 GBtg==
X-Gm-Message-State: APjAAAUqL2w3anqeP/HNLIXrW3fXHKbbooyp7REdzh1fliahHzwAu0GW
 pO0f/KdN+i/ovO3PQC9sdpgoZrL0jkEu38StN9I=
X-Google-Smtp-Source: APXvYqyu+zQWpPUhSK39k4D4RUhFjetnEH1up4EM+Xp1O/Hv73r7yeNz+2eg9noCtXeomDelsDrJKqtKpzToowGRFyM=
X-Received: by 2002:a17:902:2a68:: with SMTP id
 i95mr9980386plb.167.1562393642145; 
 Fri, 05 Jul 2019 23:14:02 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 6 Jul 2019 01:13:51 -0500
Message-ID: <CAH2r5mtb_g1Hx4UPB+5XpSY3Ew_fn=bdjLnpRD=ZQymJxrUw0g@mail.gmail.com>
Subject: [PATCH] Improve performance of POSIX open - request query disk id
 open context
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000000a58e8058cfd1eb6"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000000a58e8058cfd1eb6
Content-Type: text/plain; charset="UTF-8"

We can cut the number of roundtrips on open (may also
help some rename cases as well) by returning the inode
number in the SMB2 open request itself instead of
querying it afterwards via a query FILE_INTERNAL_INFO.
This should significantly improve the performance of
posix open.

Add SMB2_CREATE_QUERY_ON_DISK_ID create context request
on open calls so that when server supports this we
can save a roundtrip for QUERY_INFO on every open.

Follow on patch will add the response processing for
SMB2_CREATE_QUERY_ON_DISK_ID context and optimize
smb2_open_file to avoid the extra network roundtrip
on every posix open. This patch adds the context on
SMB2/SMB3 open requests.

-- 
Thanks,

Steve

--0000000000000a58e8058cfd1eb6
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3-query-inode-number-on-open-via-create-context.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3-query-inode-number-on-open-via-create-context.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jxr4t5y30>
X-Attachment-Id: f_jxr4t5y30

RnJvbSBlYjkxYTdkYTlkMjg2YzQ2YmNhZjMwYzlkOGJkOWNhOTc3YWQ5ODMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFNhdCwgNiBKdWwgMjAxOSAwMTowMzowNyAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIFNN
QjM6IHF1ZXJ5IGlub2RlIG51bWJlciBvbiBvcGVuIHZpYSBjcmVhdGUgY29udGV4dAoKV2UgY2Fu
IGN1dCB0aGUgbnVtYmVyIG9mIHJvdW5kdHJpcHMgb24gb3BlbiAobWF5IGFsc28KaGVscCBzb21l
IHJlbmFtZSBjYXNlcyBhcyB3ZWxsKSBieSByZXR1cm5pbmcgdGhlIGlub2RlCm51bWJlciBpbiB0
aGUgU01CMiBvcGVuIHJlcXVlc3QgaXRzZWxmIGluc3RlYWQgb2YKcXVlcnlpbmcgaXQgYWZ0ZXJ3
YXJkcyB2aWEgYSBxdWVyeSBGSUxFX0lOVEVSTkFMX0lORk8uClRoaXMgc2hvdWxkIHNpZ25pZmlj
YW50bHkgaW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb2YKcG9zaXggb3Blbi4KCkFkZCBTTUIyX0NS
RUFURV9RVUVSWV9PTl9ESVNLX0lEIGNyZWF0ZSBjb250ZXh0IHJlcXVlc3QKb24gb3BlbiBjYWxs
cyBzbyB0aGF0IHdoZW4gc2VydmVyIHN1cHBvcnRzIHRoaXMgd2UKY2FuIHNhdmUgYSByb3VuZHRy
aXAgZm9yIFFVRVJZX0lORk8gb24gZXZlcnkgb3Blbi4KCkZvbGxvdyBvbiBwYXRjaCB3aWxsIGFk
ZCB0aGUgcmVzcG9uc2UgcHJvY2Vzc2luZyBmb3IKU01CMl9DUkVBVEVfUVVFUllfT05fRElTS19J
RCBjb250ZXh0IGFuZCBvcHRpbWl6ZQpzbWIyX29wZW5fZmlsZSB0byBhdm9pZCB0aGUgZXh0cmEg
bmV0d29yayByb3VuZHRyaXAKb24gZXZlcnkgcG9zaXggb3Blbi4gVGhpcyBwYXRjaCBhZGRzIHRo
ZSBjb250ZXh0IG9uClNNQjIvU01CMyBvcGVuIHJlcXVlc3RzLgoKU2lnbmVkLW9mZi1ieTogU3Rl
dmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvc21iMnBkdS5j
IHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGZz
L2NpZnMvc21iMnBkdS5oIHwgIDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9mcy9jaWZzL3NtYjJwZHUuYyBiL2ZzL2NpZnMvc21iMnBkdS5j
CmluZGV4IDM0ZDUzOTdhMTk4OS4uZjU4ZTRkYzM5ODdiIDEwMDY0NAotLS0gYS9mcy9jaWZzL3Nt
YjJwZHUuYworKysgYi9mcy9jaWZzL3NtYjJwZHUuYwpAQCAtMjExOCw2ICsyMTE4LDQ4IEBAIGFk
ZF90d2FycF9jb250ZXh0KHN0cnVjdCBrdmVjICppb3YsIHVuc2lnbmVkIGludCAqbnVtX2lvdmVj
LCBfX3U2NCB0aW1ld2FycCkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHN0cnVjdCBjcnRfcXVl
cnlfaWRfY3R4dCAqCitjcmVhdGVfcXVlcnlfaWRfYnVmKHZvaWQpCit7CisJc3RydWN0IGNydF9x
dWVyeV9pZF9jdHh0ICpidWY7CisKKwlidWYgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgY3J0X3F1
ZXJ5X2lkX2N0eHQpLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWJ1ZikKKwkJcmV0dXJuIE5VTEw7CisK
KwlidWYtPmNjb250ZXh0LkRhdGFPZmZzZXQgPSBjcHVfdG9fbGUxNigwKTsKKwlidWYtPmNjb250
ZXh0LkRhdGFMZW5ndGggPSBjcHVfdG9fbGUzMigwKTsKKwlidWYtPmNjb250ZXh0Lk5hbWVPZmZz
ZXQgPSBjcHVfdG9fbGUxNihvZmZzZXRvZgorCQkJCShzdHJ1Y3QgY3J0X3F1ZXJ5X2lkX2N0eHQs
IE5hbWUpKTsKKwlidWYtPmNjb250ZXh0Lk5hbWVMZW5ndGggPSBjcHVfdG9fbGUxNig0KTsKKwkv
KiBTTUIyX0NSRUFURV9RVUVSWV9PTl9ESVNLX0lEIGlzICJRRmlkIiAqLworCWJ1Zi0+TmFtZVsw
XSA9ICdRJzsKKwlidWYtPk5hbWVbMV0gPSAnRic7CisJYnVmLT5OYW1lWzJdID0gJ2knOworCWJ1
Zi0+TmFtZVszXSA9ICdkJzsKKwlyZXR1cm4gYnVmOworfQorCisvKiBTZWUgTVMtU01CMiAyLjIu
MTMuMi45ICovCitzdGF0aWMgaW50CithZGRfcXVlcnlfaWRfY29udGV4dChzdHJ1Y3Qga3ZlYyAq
aW92LCB1bnNpZ25lZCBpbnQgKm51bV9pb3ZlYykKK3sKKwlzdHJ1Y3Qgc21iMl9jcmVhdGVfcmVx
ICpyZXEgPSBpb3ZbMF0uaW92X2Jhc2U7CisJdW5zaWduZWQgaW50IG51bSA9ICpudW1faW92ZWM7
CisKKwlpb3ZbbnVtXS5pb3ZfYmFzZSA9IGNyZWF0ZV9xdWVyeV9pZF9idWYoKTsKKwlpZiAoaW92
W251bV0uaW92X2Jhc2UgPT0gTlVMTCkKKwkJcmV0dXJuIC1FTk9NRU07CisJaW92W251bV0uaW92
X2xlbiA9IHNpemVvZihzdHJ1Y3QgY3J0X3F1ZXJ5X2lkX2N0eHQpOworCWlmICghcmVxLT5DcmVh
dGVDb250ZXh0c09mZnNldCkKKwkJcmVxLT5DcmVhdGVDb250ZXh0c09mZnNldCA9IGNwdV90b19s
ZTMyKAorCQkJCXNpemVvZihzdHJ1Y3Qgc21iMl9jcmVhdGVfcmVxKSArCisJCQkJaW92W251bSAt
IDFdLmlvdl9sZW4pOworCWxlMzJfYWRkX2NwdSgmcmVxLT5DcmVhdGVDb250ZXh0c0xlbmd0aCwg
c2l6ZW9mKHN0cnVjdCBjcnRfcXVlcnlfaWRfY3R4dCkpOworCSpudW1faW92ZWMgPSBudW0gKyAx
OworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50CiBhbGxvY19wYXRoX3dpdGhfdHJlZV9wcmVm
aXgoX19sZTE2ICoqb3V0X3BhdGgsIGludCAqb3V0X3NpemUsIGludCAqb3V0X2xlbiwKIAkJCSAg
ICBjb25zdCBjaGFyICp0cmVlbmFtZSwgY29uc3QgX19sZTE2ICpwYXRoKQpAQCAtMjQ0Niw2ICsy
NDg4LDEyIEBAIFNNQjJfb3Blbl9pbml0KHN0cnVjdCBjaWZzX3Rjb24gKnRjb24sIHN0cnVjdCBz
bWJfcnFzdCAqcnFzdCwgX191OCAqb3Bsb2NrLAogCQkJcmV0dXJuIHJjOwogCX0KIAorCWlmIChu
X2lvdiA+IDIpIHsKKwkJc3RydWN0IGNyZWF0ZV9jb250ZXh0ICpjY29udGV4dCA9CisJCQkoc3Ry
dWN0IGNyZWF0ZV9jb250ZXh0ICopaW92W25faW92LTFdLmlvdl9iYXNlOworCQljY29udGV4dC0+
TmV4dCA9IGNwdV90b19sZTMyKGlvdltuX2lvdi0xXS5pb3ZfbGVuKTsKKwl9CisJYWRkX3F1ZXJ5
X2lkX2NvbnRleHQoaW92LCAmbl9pb3YpOwogCiAJcnFzdC0+cnFfbnZlYyA9IG5faW92OwogCXJl
dHVybiAwOwpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9zbWIycGR1LmggYi9mcy9jaWZzL3NtYjJwZHUu
aAppbmRleCAwNTNlYzYyMWU3YjkuLmEzOTdjZWE3NDRjZCAxMDA2NDQKLS0tIGEvZnMvY2lmcy9z
bWIycGR1LmgKKysrIGIvZnMvY2lmcy9zbWIycGR1LmgKQEAgLTg0MSw2ICs4NDEsMTIgQEAgc3Ry
dWN0IGNydF90d2FycF9jdHh0IHsKIAogfSBfX3BhY2tlZDsKIAorLyogU2VlIE1TLVNNQjIgMi4y
LjEzLjIuOSAqLworc3RydWN0IGNydF9xdWVyeV9pZF9jdHh0IHsKKwlzdHJ1Y3QgY3JlYXRlX2Nv
bnRleHQgY2NvbnRleHQ7CisJX191OAlOYW1lWzhdOworfSBfX3BhY2tlZDsKKwogI2RlZmluZSBD
T1BZX0NIVU5LX1JFU19LRVlfU0laRQkyNAogc3RydWN0IHJlc3VtZV9rZXlfcmVxIHsKIAljaGFy
IFJlc3VtZUtleVtDT1BZX0NIVU5LX1JFU19LRVlfU0laRV07Ci0tIAoyLjIwLjEKCg==
--0000000000000a58e8058cfd1eb6--

