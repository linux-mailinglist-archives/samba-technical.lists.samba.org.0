Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122217EC15
	for <lists+samba-technical@lfdr.de>; Mon,  9 Mar 2020 23:30:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=+f3mf2HMs66alunhIh+UgAostcuS8BlHkpImb9Iv/50=; b=0R/mg66iNaGL/37tHTJq0Q8QGp
	JXILMCo+wF3shS8365Wa+AWkz3UrzkIHfMGKfCoj0tGZ230Ngw4eKfoNdcBYVdYkiJoAqHWmk7nqX
	HSYbKFvMtJhJ7becfEwf1xm/XaH+xoGaVA1o++B/lAo0pvG7L8BI74nC/eu30G5bIjokWvwPJeAVv
	98jpcqkjKSyfzFrWWhw2vnlC03ofpb9r69bIR3ehZJQAGiJOnRT85f9Chx2bohjIfz23YLRtTwOl8
	iXpL0B2dcRzZ38Upan2UDIe0i6kZLggNV1GRvNh5e8L/zhMFJjcr71Qz8vVvok0Lmoy86aN7ZIlZB
	obrXm/hA==;
Received: from ip6-localhost ([::1]:19568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBQuO-00FZLF-5f; Mon, 09 Mar 2020 22:30:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37462) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBQuG-00FZL8-Lv
 for samba-technical@lists.samba.org; Mon, 09 Mar 2020 22:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=+f3mf2HMs66alunhIh+UgAostcuS8BlHkpImb9Iv/50=; b=gOYPOIt4StCCGd32Lumly4a3oN
 24240gRFzKv7c31lFUGgn1VCYkBcAyOROqJoC0nP/qLugzL6KLfveX2q+JJFwMq5+wl3pGPCk/d8U
 kIE3o0qW0zH9uv5cIGRnNg6e4g3a7w7TlLgpOLyD3GOWlC7PuYuIqMkrJ3I1JqbOT+bgrQlAS19pS
 G7tdaLqPMBtRHFR1NXLPd9C8I9qLCcmfgT06WsesZ7rZduWUvr00QY328tL2qCFrXTVf+i6rxQVT2
 0f921W9/Gt0o1VdBOsFp0rmbaXdEDVL1y0Rg90XISEOX8bT5jv/jMjxSth8MBZ1aEkvK03KGMMsWv
 CZRDvylF0dmMvK/a25OhQplKNn+EVGFiDA/jtfbXdN8viksSZS+joWrEHLZ2vMNkjww+Jw4lN1KAX
 GyEZNLv+4YysfqzaStzOWmztNomkjzqvWew8aCVYLTAyAxsRj7XSTk8QEtNySChAqHu5AINEVNVHs
 InS3tkFLW1BmHf+7hJuSUGCC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBQuE-00015p-PT; Mon, 09 Mar 2020 22:29:51 +0000
Message-ID: <5703e4c814b59b0624e2dbe99f7d89e79775115f.camel@samba.org>
Subject: Re: Samba File Server and Docker
To: Dan Seguin <dan.seguin@Cord3Inc.com>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Tue, 10 Mar 2020 11:29:46 +1300
In-Reply-To: <1583784238870.92348@Cord3Inc.com>
References: <1583784238870.92348@Cord3Inc.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Mon, 2020-03-09 at 20:03 +0000, Dan Seguin via samba-technical
wrote:
> Hi all, 
> 
> I would have sworn I saw a snippet lately on the list about there
> being some issue with running Samba in a container because of
> required privileges (relating to namespaces?). 
> 
> I can't seem to find it. I may have seen it in the earlier archives
> when I was dredging for info. 
> 
> (I hope I'm not going senile here!)
> 
> Either way, are there any issues with containerizing Samba (file
> server)?

Yes.  If you want to use vfs_acl_xattr, to store a full NT ACL, then
you will need the container to be privileged so it can store into the
root-only namespace.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







