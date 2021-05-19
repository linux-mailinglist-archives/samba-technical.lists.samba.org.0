Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F93884A6
	for <lists+samba-technical@lfdr.de>; Wed, 19 May 2021 04:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=DNcQYs385MISgJXv84aXGEpkd3glDFMKy65DgW7D35c=; b=tqkEjGvbjZTjvX/Vx+J5/NHQJY
	tsevtssUOYHUTa6t8sOYEMIxK5VQFI8KORu/1Z20LYunjFBI07OEuPsy62xDT9PHFQWH/To0DqMbU
	lcBwo2If0T3YDHownG2ahv8mLJq/OyKLm1LeR8DkTlqS3Uqxx4T6ds2XYDv6Kv1NUl4QggXptr5UD
	t8spsTUzLBp8MhhGIDxjVw3ROt4dxAFGZ7AO4vNjBuHQenvCahOVVuar2VS9eG2jdNHVhqx9c7bb6
	o55mSO9gRV+zBoMbnlthG0i1WxMYNfQQTeE4iEWgE25S6LhXB5MwNIEBQb6sr5TSzwm5lJ6afczjO
	lc+R47KQ==;
Received: from ip6-localhost ([::1]:56256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljBfI-001Zz8-7h; Wed, 19 May 2021 02:10:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26462) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljBfC-001Zyx-81
 for samba-technical@lists.samba.org; Wed, 19 May 2021 02:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=DNcQYs385MISgJXv84aXGEpkd3glDFMKy65DgW7D35c=; b=I3xjEfiVjzF0/itM1LooRgaIL8
 bk8k6EjvJkbA/YnLSBOXu6L5C51BGwyMR08360r0PjVQ3XX2VHmZM2Nz5ds+5S1eJueidKedApv58
 9fhi/tLfEZHmfD0UbwKHJlOq4aNGZS1oiWNHUMvDmqC1mreFmNLoDx6F0Qo3Z2fwKdENzc5YC0IvY
 y6PVFjZKMR38FSZYu2Gv7O6CbI3q3G74S67tTI/Qn66rjb928Is+AtbflUEj4o7KQOl1MvmMSSMd5
 qRzTEjau5hYf+XZaVw0s+jwnc8ZOiSTv6Wuj9LqHGrlYtYwNruWiOP09YXC6CIsFDcAtd3NBI2yHg
 6iaw8q9de6pwWCkY4MM3tbXjAt3SjCHD5i6jonoTG/EeHVJ4VvIAUYql4+tWQ9Dz71T0N7OyvbVom
 wrimrN+LtLqJttf60+3wJWMwZdBNpdC3DtEJ/GoiVx+4D3gNuBpCKT2k1sIpfoxdDIovEId8hmtgN
 sZK5ztLIxgFXLUAKtukO6Lif;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljBfA-0002oq-HJ; Wed, 19 May 2021 02:10:21 +0000
Message-ID: <afc6730cd40ddeff92db1fc82b0aec32f09d85a3.camel@samba.org>
Subject: Re: Offline logon flapping in autobuild?
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Wed, 19 May 2021 14:10:17 +1200
In-Reply-To: <a7020786d9a620ea18f686fe4ac2c5d6c0a4b800.camel@samba.org>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <2444523.AYHQVFttfo@magrathea>
 <530ded817f79e3cec0561c0bc59868ab193ef1c0.camel@samba.org>
 <4972011.ALVdVshByh@magrathea>
 <482fc14dfd6b782ec12643f88d4c65d9f266619c.camel@samba.org>
 <a7020786d9a620ea18f686fe4ac2c5d6c0a4b800.camel@samba.org>
Content-Type: multipart/mixed; boundary="=-8EZbDCNH4bHLt5CZeKmi"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-8EZbDCNH4bHLt5CZeKmi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-05-19 at 13:52 +1200, Andrew Bartlett wrote:
> On Wed, 2021-05-19 at 06:52 +1200, Andrew Bartlett wrote:
> > 
> > As mentioned, my error is failing to start winbindd.
> > 
> > I think my username is too long (I've had this before), and your
> > new
> > test environment has a longer name, and so we are hitting the
> > maximum
> > path length.  This is why jra, bless his short username, gets to
> > push
> > all day without issue.
> > 
> > Just a hunch, no evidence right now, but we have had things like
> > this
> > before hitting the maximum length of a path to a unix domain
> > socket.
> 
> You might be able to find logs on sn-devel in:
> 
> /m/abartlet/aMASTER/b4145403/samba-mit-build
> 
> An administrator should be able to remove this once done (I get
> permission denied trying to clean thing up on sn-devel, not sure
> why).
> 
> Andrew Bartlett

This patch seems to help if you are "abartlet" but probably not if you
are "bbaumbach" or "mmuehlfeld".

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions





--=-8EZbDCNH4bHLt5CZeKmi
Content-Disposition: attachment;
	filename*0=0001-selftest-standardise-and-shorten-winbind-socket-name.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-selftest-standardise-and-shorten-winbind-socket-name.patch";
	charset="UTF-8"

RnJvbSAzNjJhMTMxMGE2MjlmZmY0MTRiNTNmMTJiMTZjYzg2NmJjZTU1ZDJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQmFydGxldHQgPGFiYXJ0bGV0QHNhbWJhLm9yZz4K
RGF0ZTogV2VkLCAxOSBNYXkgMjAyMSAxMzo1NzoyMSArMTIwMApTdWJqZWN0OiBbUEFUQ0hdIHNl
bGZ0ZXN0OiBzdGFuZGFyZGlzZSBhbmQgc2hvcnRlbiB3aW5iaW5kIHNvY2tldCBuYW1lCgpUaGUg
ZnVsbCBwYXRoIHRvIHRoZSB3aW5iaW5kZCBzb2NrZXQgbXVzdCBmaXQgd2l0aGluIGEgc3RydWN0
IHNvY2thZGRyX3VuIGFuZCB0aGlzIGhlbHBzIHVzIHdvcmsKd2hlcmUgdGhpcyBpcyBxdWl0ZSBk
ZWVwIG9uIHRoZSBzZXJ2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQmFydGxldHQgPGFiYXJ0
bGV0QHNhbWJhLm9yZz4KLS0tCiBzZWxmdGVzdC90YXJnZXQvU2FtYmEzLnBtIHwgMiArLQogc2Vs
ZnRlc3QvdGFyZ2V0L1NhbWJhNC5wbSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NlbGZ0ZXN0L3RhcmdldC9TYW1i
YTMucG0gYi9zZWxmdGVzdC90YXJnZXQvU2FtYmEzLnBtCmluZGV4IDY5ZTdmZjdkODI2Li5hYWMw
ZGYwZjVhZiAxMDA3NTUKLS0tIGEvc2VsZnRlc3QvdGFyZ2V0L1NhbWJhMy5wbQorKysgYi9zZWxm
dGVzdC90YXJnZXQvU2FtYmEzLnBtCkBAIC0yMjU0LDcgKzIyNTQsNyBAQCBzdWIgcHJvdmlzaW9u
KCQkKQogCXB1c2goQGRpcnMsJGxvY2FsX3N5bWxpbmtzX3NocmRpcik7CiAKIAkjIHRoaXMgZ2V0
cyBhdXRvY3JlYXRlZCBieSB3aW5iaW5kZAotCW15ICR3YnNvY2tkaXI9IiRwcmVmaXhfYWJzL3dp
bmJpbmRkIjsKKwlteSAkd2Jzb2NrZGlyPSIkcHJlZml4X2Ficy93YnNvY2siOwogCiAJbXkgJG5t
YmRzb2NrZGlyPSIkcHJlZml4X2Ficy9ubWJkIjsKIAl1bmxpbmsoJG5tYmRzb2NrZGlyKTsKZGlm
ZiAtLWdpdCBhL3NlbGZ0ZXN0L3RhcmdldC9TYW1iYTQucG0gYi9zZWxmdGVzdC90YXJnZXQvU2Ft
YmE0LnBtCmluZGV4IDMzZjUzZmU2OGUyLi43MTBmNDYwOTZjMSAxMDA3NTUKLS0tIGEvc2VsZnRl
c3QvdGFyZ2V0L1NhbWJhNC5wbQorKysgYi9zZWxmdGVzdC90YXJnZXQvU2FtYmE0LnBtCkBAIC01
OTksNyArNTk5LDcgQEAgc3ViIHByb3Zpc2lvbl9yYXdfcHJlcGFyZSgkJCQkJCQkJCQkJCQkJCkK
IAkkY3R4LT57bG9nZGlyfSA9ICIkcHJlZml4X2Ficy9sb2dzIjsKIAkkY3R4LT57c3RhdGVkaXJ9
ID0gIiRwcmVmaXhfYWJzL3N0YXRlZGlyIjsKIAkkY3R4LT57Y2FjaGVkaXJ9ID0gIiRwcmVmaXhf
YWJzL2NhY2hlZGlyIjsKLQkkY3R4LT57d2luYmluZGRfc29ja2V0X2Rpcn0gPSAiJHByZWZpeF9h
YnMvd2luYmluZGRfc29ja2V0IjsKKwkkY3R4LT57d2luYmluZGRfc29ja2V0X2Rpcn0gPSAiJHBy
ZWZpeF9hYnMvd2Jzb2NrIjsKIAkkY3R4LT57bnRwX3NpZ25kX3NvY2tldF9kaXJ9ID0gIiRwcmVm
aXhfYWJzL250cF9zaWduZF9zb2NrZXQiOwogCSRjdHgtPntuc3N3cmFwX3Bhc3N3ZH0gPSAiJGN0
eC0+e2V0Y2Rpcn0vcGFzc3dkIjsKIAkkY3R4LT57bnNzd3JhcF9ncm91cH0gPSAiJGN0eC0+e2V0
Y2Rpcn0vZ3JvdXAiOwotLSAKMi4yNS4xCgo=


--=-8EZbDCNH4bHLt5CZeKmi--


