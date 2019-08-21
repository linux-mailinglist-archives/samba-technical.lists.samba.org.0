Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A99497023
	for <lists+samba-technical@lfdr.de>; Wed, 21 Aug 2019 05:15:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=+mv7JwCNUrfzgtS/y7cPkmA9ERfr6LipaVMgvtoUuHM=; b=F8oWHszgq9heHxEOf6yKkPfM1I
	+M77eScmfjzyGV2ofp/6yw6F13CQIODe19gk9tD734NXQuJoCy0E9yceIp3FjGt+dUdCo8aHnfdQS
	303QBGX3DwN7UxpWXDkPf3vNbOl0JxdR8SL2xThezksnmyWNrSHnJXFegI1st0cZG/n/dtVVU3Ao7
	+IxwxSUAiXFFJhg5s84dhVcNZ/Af/A09/qnH26I7cqpqdIej4k5XYKF9vml10zIeuAHnW3nzqAQMu
	0hGYXRBpXv/7TZxJytMxULTKTrl0Zeb+1TXEHhPavm4NywD2PrtVJOIeIavTCu3yY0LH3ZJP38CVG
	5dctzMrg==;
Received: from localhost ([::1]:38542 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i0H4d-007JEJ-5f; Wed, 21 Aug 2019 03:14:11 +0000
Received: from devianza.investici.org ([198.167.222.108]:62241) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0H4Z-007JEC-8f
 for samba-technical@lists.samba.org; Wed, 21 Aug 2019 03:14:09 +0000
Received: from mx2.investici.org (localhost [127.0.0.1])
 by devianza.investici.org (Postfix) with ESMTP id D401FE05E6;
 Wed, 21 Aug 2019 03:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1566357242;
 bh=+mv7JwCNUrfzgtS/y7cPkmA9ERfr6LipaVMgvtoUuHM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=j1OyaemPtcqjXisL6d0OmzRxjMd1qQnQHmtUK7s+OuEFo3MwK14Gn+t60zRfBCfKX
 zWpMykF14nEr4gavqQz6OWcpxa7bFQS8ivz9xdxqyUm/7JVU6D9K2FATMRF0K797jN
 /r+WL3mHBUX0pArR139fmMmpW/LOXUN0l5K/lsOg=
Received: from [198.167.222.108] (mx2.investici.org [198.167.222.108])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id 7C336E05E3; Wed, 21 Aug 2019 03:13:59 +0000 (UTC)
Message-ID: <b271e08ddfa327529a3579d5d2fbefe269a8de64.camel@cryptolab.net>
Subject: Re: NT_STATUS_INVALID_HANDLE during file open with  vfs_glusterfs
To: samba-technical <samba-technical@lists.samba.org>
Date: Wed, 21 Aug 2019 08:43:53 +0530
In-Reply-To: <e3886f8fcb0ed4aae2965099bcdb0b4ff35a581a.camel@cryptolab.net>
References: <e3886f8fcb0ed4aae2965099bcdb0b4ff35a581a.camel@cryptolab.net>
Content-Type: multipart/mixed; boundary="=-nAhA7hl5sSICfsKZGz6B"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: "Volker.Lendecke" <Volker.Lendecke@SerNet.DE>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-nAhA7hl5sSICfsKZGz6B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-08-05 at 19:52 +0530, Anoop C S via samba-technical wrote:
> Hi all,
> 
> The following commit changed the way in which O_NONBLOCK is
> added/removed from file status flags during open.
> 
> https://git.samba.org/?p=samba.git;a=commit;h=ef582ffcf3a220b73f678d9bce0fd37800f76c54
> smbd: Always open files with O_NONBLOCK
> 
> Since O_NONBLOCK is now internally getting added unconditionally,
> storage backed by GlusterFS volumes using vfs_glusterfs produces
> *Invalid file handle* error while opening files(I tested from
> Windows).
> set_blocking() from open_file() is now being invoked due to the
> presence of O_NONBLOCK flag and fails at fcntl() call operating on
> fsp-
> > fh->fd which is obviously bad and returns EBADF.
> 
> Thus when open file descriptors are handled as fsp_extensions we may
> have to rely on VFS itself to get the job done.

Based on follow-up offline discussions proposing the attached patch for
review. Since this is not supposed to be land in release branches I
hope we are good with not adding the BUG in commit message.

Pipeline:
https://gitlab.com/samba-team/devel/samba/pipelines/77444128

Thanks,
Anoop C S. 

--=-nAhA7hl5sSICfsKZGz6B
Content-Disposition: attachment;
	filename="0001-vfs_glusterfs-Return-fake-fd-from-pipe-during-open.patch"
Content-Type: text/x-patch;
	name="0001-vfs_glusterfs-Return-fake-fd-from-pipe-during-open.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA5NjQzZDVlMzRlMTA3NmVkODJiNDNlZDI0YTk5NmE5MmI3MTJlNDc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbm9vcCBDIFMgPGFub29wY3NAcmVkaGF0LmNvbT4KRGF0ZTog
V2VkLCAxNCBBdWcgMjAxOSAxODowMzowMSArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIHZmc19nbHVz
dGVyZnM6IFJldHVybiBmYWtlIGZkIGZyb20gcGlwZSgpIGR1cmluZyBvcGVuCgpUbyB3b3JrYXJv
dW5kIHRoZSBwcm9ibGVtIG9mIGZjbnRsKCkgYWN0aW5nIHVwb24gZnNwLT5maC0+ZmQgaW5zdGVh
ZCBvZgpWRlMgYmFzZWQgb3BlbiBmZCB3ZSBoYXZlIHRvIHByb3ZpZGUgYSB2YWxpZCBmZCBmcm9t
IHRoZSBzeXN0ZW0uIEFsc28KYWRkZWQgYSBGSVhNRSBub3RlIGZvciBmdXR1cmUgcmVmZXJlbmNl
IHdoZW4gd2UgaGF2ZSBTTUJfVkZTX0ZDTlRMIGluCnBsYWNlIHRvIGdldCB0aGlzIGZpeGVkIHBy
b3Blcmx5LgoKU2lnbmVkLW9mZi1ieTogQW5vb3AgQyBTIDxhbm9vcGNzQHJlZGhhdC5jb20+Ci0t
LQogc291cmNlMy9tb2R1bGVzL3Zmc19nbHVzdGVyZnMuYyB8IDIyICsrKysrKysrKysrKysrKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3NvdXJjZTMvbW9kdWxlcy92ZnNfZ2x1c3RlcmZzLmMgYi9zb3VyY2UzL21v
ZHVsZXMvdmZzX2dsdXN0ZXJmcy5jCmluZGV4IDA5Mjk5YmM3MGM1Li4yZTRkZjZhMjAzOCAxMDA2
NDQKLS0tIGEvc291cmNlMy9tb2R1bGVzL3Zmc19nbHVzdGVyZnMuYworKysgYi9zb3VyY2UzL21v
ZHVsZXMvdmZzX2dsdXN0ZXJmcy5jCkBAIC02MzEsNiArNjMxLDcgQEAgc3RhdGljIGludCB2ZnNf
Z2x1c3Rlcl9vcGVuKHN0cnVjdCB2ZnNfaGFuZGxlX3N0cnVjdCAqaGFuZGxlLAogewogCWdsZnNf
ZmRfdCAqZ2xmZDsKIAlnbGZzX2ZkX3QgKipwX3RtcDsKKwlpbnQgZmFrZWZkWzJdOwogCiAJU1RB
UlRfUFJPRklMRShzeXNjYWxsX29wZW4pOwogCkBAIC02NjAsOCArNjYxLDIzIEBAIHN0YXRpYyBp
bnQgdmZzX2dsdXN0ZXJfb3BlbihzdHJ1Y3QgdmZzX2hhbmRsZV9zdHJ1Y3QgKmhhbmRsZSwKIAkq
cF90bXAgPSBnbGZkOwogCiAJRU5EX1BST0ZJTEUoc3lzY2FsbF9vcGVuKTsKLQkvKiBBbiBhcmJp
dHJhcnkgdmFsdWUgZm9yIGVycm9yIHJlcG9ydGluZywgc28geW91IGtub3cgaXRzIHVzLiAqLwot
CXJldHVybiAxMzM3MTMzNzsKKworCS8vIEZJWE1FCisJLyogRHVlIHRvIGxhY2sgb2YgU01CX1ZG
U19GQ05UTCB3ZSByZXR1cm4gZmFrZSBmZCBmcm9tIHBpcGUoKSB0byBnZXQKKwkgKiBwYXN0IHNl
dF9ibG9ja2luZygpIGluIG9wZW5fZmlsZSgpIGNvZGUgcGF0aC4gVGhpcyBpcyBuZWVkZWQgc2lu
Y2UKKwkgKiBPX05PTkJMT0NLIG9wZW4gZmxhZyBpcyBiZWluZyBhZGRlZCBpbnRlcm5hbGx5IGly
cmVzcGVjdGl2ZSBvZgorCSAqICdrZXJuZWwgc2hhcmUgbW9kZXMnIHNldHRpbmcgaW4gc21iLmNv
bmYuIHZmc19nbHVzdGVyZnMgbm9ybWFsbHkKKwkgKiBvcGVyYXRlcyB3aXRoICdrZXJuZWwgc2hh
cmUgbW9kZXMnIGRpc2FibGVkLgorCSAqCisJICogUmVmZXIgaHR0cHM6Ly9idWd6aWxsYS5zYW1i
YS5vcmcvc2hvd19idWcuY2dpP2lkPTE0MDYwIGZvciBkZXRhaWxzKi8KKwlpZiAocGlwZShmYWtl
ZmQpID09IC0xKSB7CisJCURCR19FUlIoInBpcGUgZmFpbGVkOiAlc1xuIiwgc3RyZXJyb3IoZXJy
bm8pKTsKKwkJcmV0dXJuIC0xOworCX0KKworCWNsb3NlKGZha2VmZFsxXSk7CisKKwlyZXR1cm4g
ZmFrZWZkWzBdOwogfQogCiBzdGF0aWMgaW50IHZmc19nbHVzdGVyX2Nsb3NlKHN0cnVjdCB2ZnNf
aGFuZGxlX3N0cnVjdCAqaGFuZGxlLApAQCAtNjc5LDYgKzY5NSw4IEBAIHN0YXRpYyBpbnQgdmZz
X2dsdXN0ZXJfY2xvc2Uoc3RydWN0IHZmc19oYW5kbGVfc3RydWN0ICpoYW5kbGUsCiAJCXJldHVy
biAtMTsKIAl9CiAKKwljbG9zZShmc3AtPmZoLT5mZCk7CisKIAlWRlNfUkVNT1ZFX0ZTUF9FWFRF
TlNJT04oaGFuZGxlLCBmc3ApOwogCiAJcmV0ID0gZ2xmc19jbG9zZShnbGZkKTsKLS0gCjIuMjEu
MAoK


--=-nAhA7hl5sSICfsKZGz6B--


