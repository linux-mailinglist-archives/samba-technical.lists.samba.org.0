Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F8D36604C
	for <lists+samba-technical@lfdr.de>; Tue, 20 Apr 2021 21:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=CSoXgf0epGU62pgTRH04ojkXYsZ9a9KxA6nLKSsKjmk=; b=hs+duUgDLyX9uCXUaqEUoC4JwQ
	VaSv5gBZPjIZTeWyMLToc6j4dbjQRmPPWLSTYI72YhBY3wnK4yc3FtRdwshkz1v4OTp0hIU5YnKdR
	DXagE6nNTVDY8wGW0ybNiwWAz5O0eWF7MKh5ExKoxGPvuQkXs/U+3sjzc05nRutB+MD4H9JH2TkbY
	08ANeR+e2CSMiYxuvXxceOWaEHI8hAZ2i370Z3fhaRKth2aJ24CLDpMfjIaDiCpkYRxw4ziNHKRLG
	yqoH0/gDKfEGWccbVC/kBA4zqsYmbfrKuebpDK4rYqF6zEB5tMTtbx0IDPB+w7N1SyxnLrhObB21o
	gI1AHukA==;
Received: from ip6-localhost ([::1]:32396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lYwB1-00BpPG-IL; Tue, 20 Apr 2021 19:36:51 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:46784) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lYwAr-00BpP9-Ok
 for samba-technical@lists.samba.org; Tue, 20 Apr 2021 19:36:46 +0000
Received: by mail-lj1-x236.google.com with SMTP id u20so44919640lja.13
 for <samba-technical@lists.samba.org>; Tue, 20 Apr 2021 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CSoXgf0epGU62pgTRH04ojkXYsZ9a9KxA6nLKSsKjmk=;
 b=EdJ+MX7Zcb/s3WJHhjLsr5RL9mYEiQhBvj7VJl/mdomuDGRxlni6zCDIRlKJrroZcv
 74KOeTJXGGeh2/8kYdJggEjG+1LuaYsR5H+j14c6GEU086nGqh8vCwcqk+KAqymV6dH8
 dtcQGcQkLoYJCKyKtBtoSR1UAXsKCvCaW8sneC9v8I41pEAp+Vkdush4bn1NsF604td0
 4ZILz2Tew7KeqoWzgr5+YGYuNzhWYT3lYaqx0+IyEYDOQtmFMSy5L3wwK15pqwfwJF2e
 bDwsiUWMw3N/HxNbwHBqtmiD4C4L/i9cnxR0NgtlqlqY1QEY3NROyozwxZkcHKh9zujO
 wUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CSoXgf0epGU62pgTRH04ojkXYsZ9a9KxA6nLKSsKjmk=;
 b=jyV8f1hvuzl8iMw5uOLl14BCTXxwe/e1cPWokk6CLmUlpN+yT/NQbVAk1L9OWAnrOl
 d/VX8gsI2SnkWdMxzj3EUchPjMRecwGDCmM/8udsEQsiYel5JaeVJ18yjPXeP8NM9trU
 pToSs8CUTT2hB2Uj/9j0QrG0tZPZJlTeQN+QuQbvtWZd/ZG/eQFNYedHbo7b8PBGAw6u
 WWozFPMYYcr/2jueAL6mK9ZyOHs4rXokjtBFPxkX0fWzp9U+gKz+TWCcdi0SSqsjeuKR
 jK+2XexmrqJafSjG/Uy/jDc6qKiLZWF50GYRWof8WvQzCJxbP2Mc702R8CMWH+IWtyRU
 3Q5Q==
X-Gm-Message-State: AOAM533uxkG+S/ZRjP07vWjpzYofkd02Jy9jc3MaipJcSSoJu0HK6PaC
 rjgc9T5ocje1zxrweggVaFAfXAdqWElGKVBeEKeU86ffzQk=
X-Google-Smtp-Source: ABdhPJzOtci3GaknqmsIj73iUAikdN/lYZJSlPyNGl0QcfO5E0KR9EY2056d/eNTnNmUBGhKV7+37WQCqp87UnBwG5E=
X-Received: by 2002:a2e:8e3b:: with SMTP id r27mr15865032ljk.346.1618947400273; 
 Tue, 20 Apr 2021 12:36:40 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 20 Apr 2021 15:36:28 -0400
Message-ID: <CAD0Ztp1y=WFbe3k=JxxbTC55O9YOhmJL2GAatHc8denZ+15h=Q@mail.gmail.com>
Subject: [PATCH] Fix sigsegv in check_stream in smbtorture smb2.streams.io
To: samba-technical@lists.samba.org
Content-Type: multipart/mixed; boundary="000000000000b42ab605c06c906e"
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

--000000000000b42ab605c06c906e
Content-Type: text/plain; charset="UTF-8"

Not 100% sure this is still a defect on master, but it was fairly recently.

If any stream create fails during smb2.streams.io
the test dies with a sigsegv in torture_comment

torture_comment calls need a struct torture_context arg,
not its mem_ctx child.  Use talloc_parent().  Also
need to call torture_result somewhere on failure.

--000000000000b42ab605c06c906e
Content-Type: application/octet-stream; 
	name="0001-Fix-sigsegv-in-check_stream-in-smbtorture-smb2.strea.patch"
Content-Disposition: attachment; 
	filename="0001-Fix-sigsegv-in-check_stream-in-smbtorture-smb2.strea.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_knqfg6xj0>
X-Attachment-Id: f_knqfg6xj0

RnJvbSBjZWNhZDJkMjY4ZWZjYWQ4MTJlNmY1YTJhZGI5NDgyYmM0ZTkxNDhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHb3Jkb24gUm9zcyA8Z29yZG9uLnJvc3NAdGludHJpLmNvbT4K
RGF0ZTogTW9uLCAxOSBBcHIgMjAyMSAxODozMToxMyAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIEZp
eCBzaWdzZWd2IGluIGNoZWNrX3N0cmVhbSBpbiBzbWJ0b3J0dXJlIHNtYjIuc3RyZWFtcy5pbwoK
dG9ydHVyZV9jb21tZW50IGNhbGxzIG5lZWQgYSBzdHJ1Y3QgdG9ydHVyZV9jb250ZXh0IGFyZywK
bm90IGl0cyBtZW1fY3R4IGNoaWxkLiAgVXNlIHRhbGxvY19wYXJlbnQoKS4gIEFsc28KbmVlZCB0
byBjYWxsIHRvcnR1cmVfcmVzdWx0IHNvbWV3aGVyZSBvbiBmYWlsdXJlLgotLS0KIHNvdXJjZTQv
dG9ydHVyZS9zbWIyL3N0cmVhbXMuYyB8IDE5ICsrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Nv
dXJjZTQvdG9ydHVyZS9zbWIyL3N0cmVhbXMuYyBiL3NvdXJjZTQvdG9ydHVyZS9zbWIyL3N0cmVh
bXMuYwppbmRleCBjMDUxNmI3Y2M4MC4uM2IwYTdjYzYxYmIgMTAwNjQ0Ci0tLSBhL3NvdXJjZTQv
dG9ydHVyZS9zbWIyL3N0cmVhbXMuYworKysgYi9zb3VyY2U0L3RvcnR1cmUvc21iMi9zdHJlYW1z
LmMKQEAgLTk4LDYgKzk4LDcgQEAgc3RhdGljIGJvb2wgY2hlY2tfc3RyZWFtKHN0cnVjdCBzbWIy
X3RyZWUgKnRyZWUsCiAJCQkgY29uc3QgY2hhciAqc25hbWUsCiAJCQkgY29uc3QgY2hhciAqdmFs
dWUpCiB7CisJc3RydWN0IHRvcnR1cmVfY29udGV4dCAqdGN0eCA9IHRhbGxvY19wYXJlbnQobWVt
X2N0eCk7CiAJc3RydWN0IHNtYjJfaGFuZGxlIGhhbmRsZTsKIAlzdHJ1Y3Qgc21iMl9jcmVhdGUg
Y3JlYXRlOwogCXN0cnVjdCBzbWIyX3JlYWQgcjsKQEAgLTExNyw3ICsxMTgsNyBAQCBzdGF0aWMg
Ym9vbCBjaGVja19zdHJlYW0oc3RydWN0IHNtYjJfdHJlZSAqdHJlZSwKIAkJaWYgKHZhbHVlID09
IE5VTEwpIHsKIAkJCXJldHVybiB0cnVlOwogCQl9IGVsc2UgewotCQkJdG9ydHVyZV9jb21tZW50
KG1lbV9jdHgsICJVbmFibGUgdG8gb3BlbiBzdHJlYW0gJXNcbiIsCisJCQl0b3J0dXJlX2NvbW1l
bnQodGN0eCwgIlVuYWJsZSB0byBvcGVuIHN0cmVhbSAlc1xuIiwKIAkJCSAgICBmdWxsX25hbWUp
OwogCQkJcmV0dXJuIGZhbHNlOwogCQl9CkBAIC0xMzcsMTMgKzEzOCwxMyBAQCBzdGF0aWMgYm9v
bCBjaGVja19zdHJlYW0oc3RydWN0IHNtYjJfdHJlZSAqdHJlZSwKIAlzdGF0dXMgPSBzbWIyX3Jl
YWQodHJlZSwgdHJlZSwgJnIpOwogCiAJaWYgKCFOVF9TVEFUVVNfSVNfT0soc3RhdHVzKSkgewot
CQl0b3J0dXJlX2NvbW1lbnQobWVtX2N0eCwgIiglcykgRmFpbGVkIHRvIHJlYWQgJWx1IGJ5dGVz
IGZyb20gIgorCQl0b3J0dXJlX2NvbW1lbnQodGN0eCwgIiglcykgRmFpbGVkIHRvIHJlYWQgJWx1
IGJ5dGVzIGZyb20gIgogCQkgICAgInN0cmVhbSAnJXMnXG4iLCBsb2NhdGlvbiwgKGxvbmcpc3Ry
bGVuKHZhbHVlKSwgZnVsbF9uYW1lKTsKIAkJcmV0dXJuIGZhbHNlOwogCX0KIAogCWlmIChtZW1j
bXAoci5vdXQuZGF0YS5kYXRhLCB2YWx1ZSwgc3RybGVuKHZhbHVlKSkgIT0gMCkgewotCQl0b3J0
dXJlX2NvbW1lbnQobWVtX2N0eCwgIiglcykgQmFkIGRhdGEgaW4gc3RyZWFtXG4iLCBsb2NhdGlv
bik7CisJCXRvcnR1cmVfY29tbWVudCh0Y3R4LCAiKCVzKSBCYWQgZGF0YSBpbiBzdHJlYW1cbiIs
IGxvY2F0aW9uKTsKIAkJcmV0dXJuIGZhbHNlOwogCX0KIApAQCAtNDA1LDYgKzQwNiwxMiBAQCBz
dGF0aWMgYm9vbCB0ZXN0X3N0cmVhbV9pbyhzdHJ1Y3QgdG9ydHVyZV9jb250ZXh0ICp0Y3R4LAog
CXJldCAmPSBjaGVja19zdHJlYW0odHJlZSwgX19sb2NhdGlvbl9fLCBtZW1fY3R4LCBmbmFtZSwK
IAkJCSAgICAiU3RyZWFtIE9uZToiLCBOVUxMKTsKIAorCWlmICghcmV0KSB7CisJCXRvcnR1cmVf
cmVzdWx0KHRjdHgsIFRPUlRVUkVfRkFJTCwKKwkJICAgICJjaGVja19zdHJlYW0oXCJTdHJlYW0g
T25lOipcIikgZmFpbGVkXG4iKTsKKwkJZ290byBkb25lOworCX0KKwogCXJldCAmPSBjaGVja19z
dHJlYW0odHJlZSwgX19sb2NhdGlvbl9fLCBtZW1fY3R4LCBmbmFtZSwKIAkJCSAgICAiU2Vjb25k
IFN0cmVhbSIsICJTRUNPTkQgU1RSRUFNIik7CiAKQEAgLTQxOSw2ICs0MjYsMTIgQEAgc3RhdGlj
IGJvb2wgdGVzdF9zdHJlYW1faW8oc3RydWN0IHRvcnR1cmVfY29udGV4dCAqdGN0eCwKIAlyZXQg
Jj0gY2hlY2tfc3RyZWFtKHRyZWUsIF9fbG9jYXRpb25fXywgbWVtX2N0eCwgZm5hbWUsCiAJCQkg
ICAgIlNlY29uZCBTdHJlYW06JEZPTyIsIE5VTEwpOwogCisJaWYgKCFyZXQpIHsKKwkJdG9ydHVy
ZV9yZXN1bHQodGN0eCwgVE9SVFVSRV9GQUlMLAorCQkgICAgImNoZWNrX3N0cmVhbShcIlNlY29u
ZCBTdHJlYW06KlwiKSBmYWlsZWRcbiIpOworCQlnb3RvIGRvbmU7CisJfQorCiAJaW8uc21iMi5p
bi5mbmFtZSA9IHNuYW1lMjsKIAlpby5zbWIyLmluLmNyZWF0ZV9kaXNwb3NpdGlvbiA9IE5UQ1JF
QVRFWF9ESVNQX09QRU5fSUY7CiAJc3RhdHVzID0gc21iMl9jcmVhdGUodHJlZSwgbWVtX2N0eCwg
Jihpby5zbWIyKSk7Ci0tIAoyLjI1LjQKCg==
--000000000000b42ab605c06c906e--

