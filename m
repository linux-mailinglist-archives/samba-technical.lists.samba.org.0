Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 285477D5EA
	for <lists+samba-technical@lfdr.de>; Thu,  1 Aug 2019 08:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=A/jqvkc+InZRH0/Fs0SQ3zvOAAAGYABwl3/aGQhd0x8=; b=mnCAYN+P4hhohY6iXVHAWGp6Rc
	tWnkH0pklIrU5OArWrg2FVkRLHtLoPmfcvYAXXzzEV9kSx4gmQfV404TQvetvdNxjFl5JTEURjQsW
	VM8Trh76hpBd7vqcTK3RN/dlPgoDZq1t9qzfEZeI+XUHSyyafe6PkjpAH56AjMnVHM784c3v0osfs
	6rCHrX43nl9yIhR/ekBCn6nSbqBtF0AAX3oR3JgOfujxIutCmI6hizxTXT6CzNNdJ9ohlVhs3kyGs
	WppPC/hPYFTOiBA6CTl60PmU4TxkQoMHv9ADg2x4z7BQpLFXBoi3VmJ9zn4IODXnBF52+wHSfW6Nv
	sf4pU/UQ==;
Received: from localhost ([::1]:44438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ht53A-003KlS-8Z; Thu, 01 Aug 2019 06:58:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59620) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ht533-003KlL-CN
 for samba-technical@lists.samba.org; Thu, 01 Aug 2019 06:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=A/jqvkc+InZRH0/Fs0SQ3zvOAAAGYABwl3/aGQhd0x8=; b=wLXrVDfjqWLPEuXSs38CpyN+oj
 RO18Aerz9wZmIVd2T8utMNhB+LTS7e2D1RY4j3VvWamo3NUqL5fZh+/53yuis3661kpFZI1yW6Bpm
 B8zma8/euff2Ke13NlO+jZrRwzR9Opg8hN41ga+gYs2M0Sj3R/HeP2kGc28Tcr1nulB0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ht530-0001Lj-En; Thu, 01 Aug 2019 06:58:46 +0000
To: samba-technical@lists.samba.org, Nico Kadel-Garcia <nkadel@gmail.com>
Subject: Re: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
Date: Thu, 01 Aug 2019 08:58:44 +0200
Message-ID: <3136808.qJGijLCe70@magrathea.fritz.box>
In-Reply-To: <CAOCN9rz0wCkZZvzsjsXKcm4+Jv0nQWicmuk6PeYwUNGinMyq3Q@mail.gmail.com>
References: <1564547155.4261.48.camel@samba.org>
 <CAOCN9ryBOTTTB8UR2fNX7ZMDM0hJHKT7-Ys8v-VDv4BCgp+uug@mail.gmail.com>
 <CAOCN9rz0wCkZZvzsjsXKcm4+Jv0nQWicmuk6PeYwUNGinMyq3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, July 31, 2019 7:37:10 AM CEST Nico Kadel-Garcia via samba-
technical wrote:
> I only repackage that, I didn't write it, Credit where it's due, and
> 
> quoting from the README.md there:
> >>This is based on sergiomb2's work at
> >>
> >>  https://github.com/sergiomb2/SambaAD
> 
> So Sergio gets credit. But I'm already using it for RHEL 7/CenbtOS 7.
> I've done some very limited testing with RHEL 8, but am waiting for
> CentOS 8 to finally be released to really test  that.
> 
> > > [1] Sadly we couldn't totally remove the Samba AES code, as SMB 2.24
> > > requires AES-CMAC-128, but the impact would be far more constrained.
> 
> Fair enough. I'd say accept the requirement of a compatibility library
> for older operating systems, and I'm glad Sergio did most of the work.

Is there a copr repo with the compat-gnutls34 available somewhere?


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



