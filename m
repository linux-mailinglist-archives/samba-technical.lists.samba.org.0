Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4025882B3
	for <lists+samba-technical@lfdr.de>; Tue,  2 Aug 2022 21:39:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YIXycbzkgX75AYn5Z2wPO396ysN8f8fDUuCOSzYTdjU=; b=NaJpUdLzisLz50HwCFDDUB4pr0
	Ryotuu52MXXjfzoWp409trVorWxAHMWybLs675uYaay3L9w/Lj3SqJd37AEIkKDt2Om6vj2VA+aDN
	z0WID5QvBVBsdPqP0pMLQMflRA0JRZWYJjLOUevI/2a9nppRNYm5eCDDVOUw5xHMZvURpI703zznE
	mT89Zgj1GaoVS19t/Z1Bt6m0MQdxf5nCkfHwAylKmfk3RAr5TrwMge6/vAjxgpxU2khvfATFD5kPS
	za7R1jraf/JNgAUPuyP2S0RXyWPgcTHuQrpH8Hk9f2FcGiZuRWDk3KIUOFzM/OLg67+E+nt8yOggF
	ZMC//pgQ==;
Received: from ip6-localhost ([::1]:50126 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oIxjg-0052vT-6T; Tue, 02 Aug 2022 19:39:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1]:39700) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oIxjY-0052vK-58
 for samba-technical@lists.samba.org; Tue, 02 Aug 2022 19:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YIXycbzkgX75AYn5Z2wPO396ysN8f8fDUuCOSzYTdjU=; b=ZPovnBz00P+VOFse/WxI65uh4/
 nFyTcE0a5fNyqzacbKHRIUuSuKPlt51Lk8EwVKyQiR5qATCkWJHxs6QFiMi0Pw7WB07vEQ9wlfT/O
 H9pZLHj7sr+T81Wp6+1qjJuGGMBw1ZKKfbKOaYmVnwyl3mz09avfBHJawJQ85oCEzTu54NQu7rvZg
 92Y93uYGK0wnKf9Ghnc83QqFoPNigWJOuu0YxiPovchEE5MyP7sOnq22fdHInLgtMYvTumq1nXzhe
 gmOgUlbIO44Cgbvz5xggW4fRH86mmMyDSh7Jdcszw0c14xxFH55kLwtOaHZXz9RumRnMFx2/KFAl6
 GTH41SrQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oIxTY-008cZO-Jo; Tue, 02 Aug 2022 19:22:44 +0000
Date: Tue, 2 Aug 2022 20:22:44 +0100
To: Enzo Matsumiya <ematsumiya@suse.de>
Subject: Re: [RFC PATCH v2 0/5] Rename "cifs" module to "smbfs"
Message-ID: <Yul5hBFmwoOQ0cxG@casper.infradead.org>
References: <20220802190048.19881-1-ematsumiya@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802190048.19881-1-ematsumiya@suse.de>
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
From: Matthew Wilcox via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matthew Wilcox <willy@infradead.org>
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, jlayton@kernel.org,
 pc@cjr.nz, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 pshilovsky@samba.org, tom@talpey.com, smfrench@gmail.com,
 linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 02, 2022 at 04:00:43PM -0300, Enzo Matsumiya wrote:
> Hi,
> 
> As part of the ongoing effort to remove the "cifs" nomenclature from the
> Linux SMB client, I'm proposing the rename of the module to "smbfs".
> 
> As it's widely known, CIFS is associated to SMB1.0, which, in turn, is
> associated with the security issues it presented in the past. Using
> "SMBFS" makes clear what's the protocol in use for outsiders, but also
> unties it from any particular protocol version. It also fits in the
> already existing "fs/smbfs_common" and "fs/ksmbd" naming scheme.
> 
> This short patch series only changes directory names and includes/ifdefs in
> headers and source code, and updates docs to reflect the rename. Other
> than that, no source code/functionality is modified (WIP though).

Why did you not reply to Jeff Layton's concern before posting a v2?

