Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25704E0B2E
	for <lists+samba-technical@lfdr.de>; Tue, 22 Oct 2019 20:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=brDEvVZhMBt2EDRt/qivKpYuKHcFAL8FSu7QAyxl/3A=; b=vAD/2iqbf72P3tqGncMdXu+x13
	KIRpv8kaTocooHZVU9RfZT/Zmap1pyzz9hpmIcv9QwZPPcHwwuMZs87RTccBmS0I7MaFRYrXsVHh4
	l0s+7IVAVTATkSHJ6wFmz/qwQetJmby5/uTqnne7qG8tlZE957K5D4oemgi66/b8UPc0Wljhw1dCg
	G9y1u2DPBX7L4mAVaA9yKBWJQmBRupaxSvodzMy+gni+YOqFOv6BXAgIwf7XSClGrPRIbF5jmAPjh
	NfLEsaOni8/c5QQMWShhXeCPRz5wyZFOG0fUrD+eOlhzwEtH2BZg9E+Vn292pRYqbBplJ1TMDHnXM
	rR642Agg==;
Received: from localhost ([::1]:54938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMyVV-001Vf5-Ar; Tue, 22 Oct 2019 18:03:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65018) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMyVR-001Veu-N2
 for samba-technical@lists.samba.org; Tue, 22 Oct 2019 18:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=brDEvVZhMBt2EDRt/qivKpYuKHcFAL8FSu7QAyxl/3A=; b=MDDqNnysvEe3kJfW0o/Yxi4UB7
 2zn9fZa3avlv1WfVaLmcUFwKjcLQg2U/cSxl9ToItIZBT9ZdQ+AN9XT2U7hc3OlzJAgT7wiQjAOGG
 XOEZL4tcFhG3VH8BfXQ4RwXvYHR98ROfhCIZ1Cv+XxIzEAkWyx44NZX9kqKyux0dDaDDA0FEo8OGI
 SqeySpE7qpHisgKhBaFexifDU8hgTDgh7CgqKvwkoYFYUmS8uq8CuIXKNjDGqpGt96aZvJdeots1v
 AUSK8cypS3KRpxAWm3gEP9gjH02oa5Jb5DY03A1Rj3qGTVtdTYSt4uTvp7XzlRk+mcJaFgNny26Oh
 ZsQNz7K9eMmLySkIBU5FOSlZVmmMmTN7gp1VlgNGoEsY2PYBuSfSe+ysmlLYWIWllF6NhhxK5RgCI
 6xMXVjUGlnSxj8WRax5sCebDLdqAr2zpcCuRx2H1k6aj1ROvDw7Kvfht8V6P6/zxVzJvQpimzZsug
 nx1eUd6jdu92K54xYnL9hFGX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMyVP-0007xd-OL; Tue, 22 Oct 2019 18:03:40 +0000
Message-ID: <732da9e0a677ad904010c8bc29a09b7514c4d5d5.camel@samba.org>
Subject: Hosting of Samba backport binaries for RHEL
To: Nico Kadel-Garcia <nkadel@gmail.com>, Dario Lesca <d.lesca@solinos.it>
Date: Wed, 23 Oct 2019 07:03:21 +1300
In-Reply-To: <F881C011-7573-4946-B05A-7952A73BF945@gmail.com>
References: <ae8f0a7928a7015d7abfa9679de2f5f4d23b4eed.camel@solinos.it>
 <F881C011-7573-4946-B05A-7952A73BF945@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-10-22 at 08:58 -0400, Nico Kadel-Garcia via samba-
technical wrote:
> > On Oct 22, 2019, at 6:17 AM, Dario Lesca <d.lesca@solinos.it>
> > wrote:
> > 
> > ﻿
> > Il giorno sab, 19/10/2019 alle 12.22 -0400, Nico Kadel-Garcia via
> > samba-technical ha scritto:
> > > Cool! I just managed to get 4.11.1 into my published CentOS 7, 8,
> > > and
> > > Fedora setup at 
> > > https://github.com/nkadel/samba4repo
> > > . This setup uses
> > > Heimdal Kerberos, which eased the gnutls requirements and made
> > > CentOS
> > > 7 easier.
> > 
> > Thanks Nico
> > How can use your great work?
> > I must rebuild all on my system (Centos8) or I can use a binary
> > repo?
> > 
> > Thank
> 
> Make a clone of the git repo, follow the notes in the README.md, and
> compile it. I’ve not been publishing binaries because I’ve lacked
> time and resources to run a high security service for such critical
> and security sensitive binaries.

Nico,

Thanks for taking the security of our users so seriously.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




