Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B652743F9EE
	for <lists+samba-technical@lfdr.de>; Fri, 29 Oct 2021 11:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=P+l7F8w+NC2uiwMkfoRjI3uBxXqAD1XzE+2p7ArZy8U=; b=VeGu1JxxyOglZ+dlOdEBnj2iWB
	cUJRA+A8sgT70UOt3KRpNUylQgQp1xolTOfAZwHd53o+sCFm4bqQ814kuGig1eyktasfZ7ObLU/FA
	S6TRHw8o02BfLIx2V+LMG0S8ds0ZIucm4y+obLSMwoZaLbVMTW+y+dSwFj4WBrktkfLJ1w8S3X6+N
	VWntTqnmVp5SJZzwu301Y5DVDBHh+PDcqDT6OccOMCgztmhDHuq788Zsw8YSxuSa1HItH0U20DENT
	6UbcWdtyShTyyrEJiYfDPCueeRXbrMWVHWZh5wgDlVCRacZJDxGcJ0eG+e5BsNpam9rZY6qJGNpqr
	qWQ1L2lQ==;
Received: from ip6-localhost ([::1]:56688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mgOF7-001jmU-O9; Fri, 29 Oct 2021 09:32:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56912) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mgOF1-001jmL-45
 for samba-technical@lists.samba.org; Fri, 29 Oct 2021 09:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=P+l7F8w+NC2uiwMkfoRjI3uBxXqAD1XzE+2p7ArZy8U=; b=kGdcQYtOqxSBVrZ2AFp2HrRqWS
 vzULDwIOq2Cq7UUJjGFJM5+CRSrqC4GUMYa7jtj8JYYAwZRqZXMqWbEz2Z9pIbxa9OwMdJTMRxj8l
 QfuFHhuRfC2fCkG7G7tJA2cvMAzoMFgPY4fCOgQo2g8SY4D/kOZFkD/pjqq27iarUALscv9b1Zb+3
 GOfuGFrGFeBSc9iFv3RaNdMP9HvMKiWztxUtY8HUtuQWQpVEFTpt+zZluIoiDeGyZoVG7Rv0SsV33
 zueTTt/yhuAbu3cmP5EuAmvMQfBC+ZWnG8rnDmS19jOJa8mkkT7Z2elyh/Ax9CLE+XfBS63d0e0Ie
 SE9mkZ9jekPHm6y8Gb9qfcTo/TgaK8XVwUIhIe9Rei3zhzYoUo2xrJxVqKcUT7m9EYlaHc/jN447S
 LBZ250qPm3yhg5O0OImO3go1UZi665Teh8XUDn7LqbLo/nk2NLTpH1CU46ziKOl4CgeE1QVGi75LV
 AkfGivgb41z7nrFVGtSkxLvB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mgOF0-003zwN-Gt
 for samba-technical@lists.samba.org; Fri, 29 Oct 2021 09:32:02 +0000
To: samba-technical@lists.samba.org
Subject: git worktrees
Date: Fri, 29 Oct 2021 11:31:59 +0200
Message-ID: <1878168.t9pZBThubR@magrathea>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I often have to hop between different branches. Either to fix a bug or to just 
run a test. As Samba doesn't support out of source builds, this was a pain 
till I discovered `git worktree` [1].

git-worktree allows you to have multiple working trees. You can use it with 
any git checkout you have. However to work with it in a nice manner, the right 
thing is to use a bare repository. Here is how this works:

Setting up the directory for the first time:

mkdir samba
cd samba
git clone --bare https://git.samba.org/samba.git .bare
echo "gitdir: ./.bare" > .git

Now you can create a branch and check it out:
git branch asn-mywork origin/master
git worktree add mywork asn-mywork

This will create a directory `mywork` and checkout the branch `asn-mywork`

cd mywork

Now you can start breaking Samba ... :-)


I've created two aliases:

[alias]
     wtb = "!f() { git branch $1 $2; git worktree add $1 $1; }; f"
     wtr = "!f() { git worktree remove $1; git branch -D $1; }; f"

Hope this is useful for others too, metze already uses it ;-)


	Andreas


[1] https://git-scm.com/docs/git-worktree


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



