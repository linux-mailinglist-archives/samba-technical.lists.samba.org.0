Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id E369E142F6
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 01:14:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rtEr4Z4/F6xDzDZmrJp0hI+Nyv9z0edEnVTpgaYBJJo=; b=Jo1Hcfm8o9u0ngvWePK2Hv7nnq
	vzaggbKJmGNqhEygnyNYVwt2OE3cLG/Ciq2FwmUnPEeFjzRvaj/h4YWP0RIIXCKnnqnPoOKgfgFXA
	rU92qJcpU8fqGz/n02MJHer6cBTM0DaXu8CQdLKVAX2rMGPkk6U/ePQ6AYYCNm8Hy+Xh5DN60nM5i
	/aTUplfhApjMLP3RgKdnHsZbjHMpnfR13DMvBhl04rm7k52zU3FabRSvE3HmfADMWPx7neUCzO0P0
	BBezvr4r28bb5xf97I7AEyci3vFjgUNak9ESA+EZUleHrvuhJv2WlVkDs/a6QqmgCzicTPoZEYDDk
	h9z1J3Dg==;
Received: from localhost ([::1]:49360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNQKG-002UqD-0i; Sun, 05 May 2019 23:13:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:39520) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNQKC-002Uq6-4B
 for samba-technical@lists.samba.org; Sun, 05 May 2019 23:13:42 +0000
Received: by mail-pl1-x636.google.com with SMTP id e92so5402396plb.6
 for <samba-technical@lists.samba.org>; Sun, 05 May 2019 16:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rtEr4Z4/F6xDzDZmrJp0hI+Nyv9z0edEnVTpgaYBJJo=;
 b=gqmRPWDMUToc+O7KKy0hCJL62wDqwtWhTRschHgtFjHWqkNVz5EGbO5EPbBeWahFYV
 Zz9WjqUC0o0xNtGN+RvMEgt3ME3+cgH06qsLaACb8AiisFa96nc2o43EYhXSRBjN/rmJ
 TSkRaxaEOeIEKil8gEJJNIYtjaeV12wubSRFnTiXmtMjzM2pAID2DVuthjxN1L5ubF6E
 qC3qDBfbn+ENt2lmuAnVZZ2u/h1ClMI9KZgS0W9eBNk3NunyvYTpiuK3vbekoI5rUhVo
 45nlPZtnv4kqYMEU2uSse50VgwSNAvs4aU6shRc+tnpstgPK4O6s5Inbjlcb54/bKOuT
 wnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtEr4Z4/F6xDzDZmrJp0hI+Nyv9z0edEnVTpgaYBJJo=;
 b=q4cZu9GxcUQtBxrgnpcA23z+xlWnbORb0Wvrgmw56nKoqg5/EALLISC2hsiV4/wc0J
 z5H/zdOagwdwYYM9mB/zHu5pwdKFFcFC4hPF6GDU4OcDG/j7fyAKebNbKNKkKprbiqw0
 RuCmnGSMuZ0eHITYQvCvl8iFSN8WyjCwvudX3hpW2rpHIK44G9i+2laToSb5fKZfE3r+
 6Z02NKclb17ynXHrPfE91jDV5o2vmwpsFtIV3hCiICs1v1YKuRlx25Zzap067C3BxP0G
 2p/+Y4Rw+qoFIQ9M9bsWRX/OwptGTMJqgz6nPDXc1snCM5g0QVJW8CcD32mJFg84OXkk
 dZXw==
X-Gm-Message-State: APjAAAUXWF1rTZHPmfOmNqSY4xBsdTNl2Zr8VgLNZnzpZEhNsCYlUa2P
 uzpsk5YMqOTYto9Kf6wjYdMO68V2cdTMq8tJcL8=
X-Google-Smtp-Source: APXvYqxLgiGSwNHT4rc6ZwfrNUyT4G4HgGa7Fw0hfwe6S9s2BUI5f5P//lePEMmktlvKx5+t/z7eIM/zaCsaFgo5NuU=
X-Received: by 2002:a17:902:8609:: with SMTP id
 f9mr27055937plo.32.1557098017882; 
 Sun, 05 May 2019 16:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mt+ogjdc9w+ppvu+GwWfojFOK_izStTkOgjs07bXVbO2A@mail.gmail.com>
In-Reply-To: <CAH2r5mt+ogjdc9w+ppvu+GwWfojFOK_izStTkOgjs07bXVbO2A@mail.gmail.com>
Date: Sun, 5 May 2019 18:13:26 -0500
Message-ID: <CAH2r5mthh7UjwN+PFnR-TZC_8fNtPkoqWwwt_iaSZxybr2ebmw@mail.gmail.com>
Subject: Re: [PATCH][SMB3] Add SMB3 protocol flags and structs for change
 notify
To: CIFS <linux-cifs@vger.kernel.org>,
 ronnie sahlberg <ronniesahlberg@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000003cb09a05882c222b"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000003cb09a05882c222b
Content-Type: text/plain; charset="UTF-8"

Minor update with feedback from Ronnie


On Sun, May 5, 2019 at 5:28 PM Steve French <smfrench@gmail.com> wrote:
>
> See MS-FSCC 2.6 and MS-SMB2 2.2.35
>
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

--0000000000003cb09a05882c222b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-Add-protocol-structs-for-change-notify-support.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-Add-protocol-structs-for-change-notify-support.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jvbjy5hg0>
X-Attachment-Id: f_jvbjy5hg0

RnJvbSBiNzA3NzRmODU3ZjdlZjY5YjNhYTA1NjRlMTlmNzA5NjI1MWUwNjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgNSBNYXkgMjAxOSAxNzoyNToxMiAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IEFkZCBwcm90b2NvbCBzdHJ1Y3RzIGZvciBjaGFuZ2Ugbm90aWZ5IHN1cHBvcnQKCkFkZCB0
aGUgU01CMyBwcm90b2NvbCBmbGFnIGRlZmluaXRpb25zIGFuZCBzdHJ1Y3RzIGZvcgpjaGFuZ2Ug
bm90aWZ5LiAgRnV0dXJlIHBhdGNoZXMgd2lsbCBhZGQgdGhlIGhvb2tzIHRvCmFsbG93IGl0IHRv
IGJlIGludm9rZWQgZnJvbSB0aGUgY2xpZW50LgoKU2VlIE1TLUZTQ0MgMi42IGFuZCBNUy1TTUIy
IDIuMi4zNQoKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQu
Y29tPgpSZXZpZXdlZC1ieTogUm9ubmllIFNhaGxiZXJnIDxsc2FobGJlckByZWRoYXQuY29tPgot
LS0KIGZzL2NpZnMvc21iMnBkdS5oIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Zz
L2NpZnMvc21iMnBkdS5oIGIvZnMvY2lmcy9zbWIycGR1LmgKaW5kZXggODY4YjAwNTY4MDhjLi5k
MjkwY2RlZmFkY2EgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21iMnBkdS5oCisrKyBiL2ZzL2NpZnMv
c21iMnBkdS5oCkBAIC0xMTQ4LDYgKzExNDgsNDIgQEAgc3RydWN0IHNtYjJfd3JpdGVfcnNwIHsK
IAlfX3U4ICAgQnVmZmVyWzFdOwogfSBfX3BhY2tlZDsKIAorLyogbm90aWZ5IGZsYWdzICovCisj
ZGVmaW5lIFNNQjJfV0FUQ0hfVFJFRQkJCTB4MDAwMQorCisvKiBub3RpZnkgY29tcGxldGlvbiBm
aWx0ZXIgZmxhZ3MuIFNlZSBNUy1GU0NDIDIuNiBhbmQgTVMtU01CMiAyLjIuMzUgKi8KKyNkZWZp
bmUgRklMRV9OT1RJRllfQ0hBTkdFX0ZJTEVfTkFNRQkJMHgwMDAwMDAwMQorI2RlZmluZSBGSUxF
X05PVElGWV9DSEFOR0VfRElSX05BTUUJCTB4MDAwMDAwMDIKKyNkZWZpbmUgRklMRV9OT1RJRllf
Q0hBTkdFX0FUVFJJQlVURVMJCTB4MDAwMDAwMDQKKyNkZWZpbmUgRklMRV9OT1RJRllfQ0hBTkdF
X1NJWkUJCQkweDAwMDAwMDA4CisjZGVmaW5lIEZJTEVfTk9USUZZX0NIQU5HRV9MQVNUX1dSSVRF
CQkweDAwMDAwMDEwCisjZGVmaW5lIEZJTEVfTk9USUZZX0NIQU5HRV9MQVNUX0FDQ0VTUwkJMHgw
MDAwMDAyMAorI2RlZmluZSBGSUxFX05PVElGWV9DSEFOR0VfQ1JFQVRJT04JCTB4MDAwMDAwNDAK
KyNkZWZpbmUgRklMRV9OT1RJRllfQ0hBTkdFX0VBCQkJMHgwMDAwMDA4MAorI2RlZmluZSBGSUxF
X05PVElGWV9DSEFOR0VfU0VDVVJJVFkJCTB4MDAwMDAxMDAKKyNkZWZpbmUgRklMRV9OT1RJRllf
Q0hBTkdFX1NUUkVBTV9OQU1FCQkweDAwMDAwMjAwCisjZGVmaW5lIEZJTEVfTk9USUZZX0NIQU5H
RV9TVFJFQU1fU0laRQkJMHgwMDAwMDQwMAorI2RlZmluZSBGSUxFX05PVElGWV9DSEFOR0VfU1RS
RUFNX1dSSVRFCQkweDAwMDAwODAwCisKK3N0cnVjdCBzbWIyX2NoYW5nZV9ub3RpZnlfcmVxIHsK
KwlzdHJ1Y3Qgc21iMl9zeW5jX2hkciBzeW5jX2hkcjsKKwlfX2xlMTYJU3RydWN0dXJlU2l6ZTsK
KwlfX2xlMTYJRmxhZ3M7CisJX19sZTMyCU91dHB1dEJ1ZmZlckxlbmd0aDsKKwlfX3U2NAlQZXJz
aXN0ZW50RmlsZUlkOyAvKiBvcGFxdWUgZW5kaWFubmVzcyAqLworCV9fdTY0CVZvbGF0aWxlRmls
ZUlkOyAvKiBvcGFxdWUgZW5kaWFubmVzcyAqLworCV9fbGUzMglDb21wbGV0aW9uRmlsdGVyOwor
CV9fdTMyCVJlc2VydmVkOworfSBfX3BhY2tlZDsKKworc3RydWN0IHNtYjJfY2hhbmdlX25vdGlm
eV9yc3AgeworCXN0cnVjdCBzbWIyX3N5bmNfaGRyIHN5bmNfaGRyOworCV9fbGUxNglTdHJ1Y3R1
cmVTaXplOyAgLyogTXVzdCBiZSA5ICovCisJX19sZTE2CU91dHB1dEJ1ZmZlck9mZnNldDsKKwlf
X2xlMzIJT3V0cHV0QnVmZmVyTGVuZ3RoOworCV9fdTgJQnVmZmVyWzFdOyAvKiBhcnJheSBvZiBm
aWxlIG5vdGlmeSBzdHJ1Y3RzICovCit9IF9fcGFja2VkOworCiAjZGVmaW5lIFNNQjJfTE9DS0ZM
QUdfU0hBUkVEX0xPQ0sJMHgwMDAxCiAjZGVmaW5lIFNNQjJfTE9DS0ZMQUdfRVhDTFVTSVZFX0xP
Q0sJMHgwMDAyCiAjZGVmaW5lIFNNQjJfTE9DS0ZMQUdfVU5MT0NLCQkweDAwMDQKLS0gCjIuMjAu
MQoK
--0000000000003cb09a05882c222b--

