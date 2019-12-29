Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C7412CAC6
	for <lists+samba-technical@lfdr.de>; Sun, 29 Dec 2019 21:33:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=XJBXeicyzkVCPK/844iTNET+iGkAjyB3zAYlIiAcE8w=; b=CgHEp54jTQn4EiikVTsQyEWXpV
	F9ANbUgtpHiiMFKSwjNUDFQIAYSP48JgbPMhs1bjTNqFD2prc2bV8C+IZrd9+/QQ308bhiLtBWXk8
	TnxGmBxQyOF/eSkeSAjzNNf9I4lMmoj1Q80vgadjpdBe16ggqcc06WiRZXmsws/jJmbtlkEz7WK1a
	4AIMBIuY8mHuihoAQJhFx0YUejkw7uhfvM6pWX1GhwRktSUpc2NiYUv6HSB+Y46IFoMEt/0uA2e/k
	qXeED6zI8Z2a9e6YZIZUeMGthy0KOmkY3QiWlUYnSfIek/y2DefXoGlRMkRAMfF5IcGq2u001dMMp
	QJ25GM5g==;
Received: from localhost ([::1]:29516 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ilfEY-000N90-61; Sun, 29 Dec 2019 20:32:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18370) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ilfEU-000N8t-S7
 for samba-technical@lists.samba.org; Sun, 29 Dec 2019 20:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=XJBXeicyzkVCPK/844iTNET+iGkAjyB3zAYlIiAcE8w=; b=rUKy7KmTLb2XAZVb/Zcvhit2hS
 AFtw0KsOa1KQs7uXw8o27N3m0hwnj5Bjni23W3DpuQezLPdGYuW7vFy4XXnNnRwiTmk/Oo9qmeTEl
 +orsCTJZ7EsewrM4X1yJYB1gLenuQtfIWTQlUI3ybQc1sZxCwevsIj6x93mNPqFcWT6nbLOtrMd+E
 ZlE3bCV6pTwGEF7TfHGBzYAq09UFcemIG0yWdcSkhLV7wsbLVQLJbgMgQ+z3iwQcRckbdHFSv2Bvy
 rU3lATnHUzjiSP3T7WV7aw2a3cbSMbtsjGvJ5Rr7viblxIEteuZRBD/xmjUAcBhakQYhRpHNt6DIr
 QjdmD3YQdeJXyb96ZBkv3jmMv+hTLYjOTMC93AalJUYUxxijlwBw5m6TER9juMTWa9H1jCg6CILn7
 j/6va0jwOe9O9qITOG1ua4HBFrrAZeO5gg2s7RyZDWQpdoXW+uf5t5H1/WLlsWE5Av8idLh1iLU3w
 C7xbtIPxpzvSzdA9QyRLvEdo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ilfEQ-00077d-K9; Sun, 29 Dec 2019 20:32:11 +0000
Date: Sun, 29 Dec 2019 12:32:08 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: Samba doesn't allow setting ACLs for special SIDs
Message-ID: <20191229203208.GA1342@jeremy-acer>
References: <CAH2r5mthJ6t+jNUPNTepRSRVxdE3RXt3qcOxR_qRzJSnHn8n=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5mthJ6t+jNUPNTepRSRVxdE3RXt3qcOxR_qRzJSnHn8n=Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Dec 24, 2019 at 03:54:43PM -0600, Steve French via samba-technical wrote:
> I noticed that Samba server doesn't allow setting ACLs for special
> SIDs (like the 'NFS' or POSIX mode bits etc.).    Looking at
> vfs_acl_xattr it automatically resets the value of
> 
> force unknown acl user to true (which prevents setting special SIDs
> that don't map to users that Samba doesn't know about).
> 
> Is there a way to configure Samba allow setting special SIDs?
> Presumably if acl_xattr is not set then the ACL can't be saved and if
> acl_xattr is used then unknown SIDs are remapped so are useless.

force unknown acl user forces owner and group SIDs to be
valid UNIX users/groups, and causes the POSIX ACL mapping
to ignore unknown ACE entries for users/groups.

Special SIDs should still be stored in the xattr ACL
store, just not mapped to POSIX.

Can you explain *exactly* what you are trying to do
here, because the problem you want to solve isn't
clear.

