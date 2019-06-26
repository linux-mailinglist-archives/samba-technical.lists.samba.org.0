Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777956E40
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 18:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=TQWUaP53LrT1dTOpsWgysEOH3c8mwGX3BP/pvmGcQsk=; b=kpcFpJu7y/HoQ3//82oU4NM32E
	5fEhye9bHqbxDcXlWqEjV1c77cEQhniDHyaWQGtIJLzl6vfBODjE8Er5gv/awzBUYmuXfyrnCmdBX
	QpkpHV1tvxkPkUwgNCr7I/Yz/8LuimC94GEJR7cx8ZvqWg1iv+E9qWOXhEzyEDr636wWyvcV28TO4
	nxcDDEMwTFRrBeNKw1EP3KI+vLq9ENgByIQ/1qA/Rfk5ykIrW+1tRrlJtPqRoiUISAnYOotWnl43N
	cd71q5xu4qW78jYWrPT8YXgsaQX5oj7lFw9nZ0rS/UZ0YVqNqMpDGmK7G1GBehsHQqPwAMUW7gyPS
	G7QI2Qzw==;
Received: from localhost ([::1]:42478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgAMC-001wTT-M6; Wed, 26 Jun 2019 16:01:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28916) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgAM9-001wTM-4Q
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 16:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=TQWUaP53LrT1dTOpsWgysEOH3c8mwGX3BP/pvmGcQsk=; b=edTeUn/vEL9gycm6laT9tK5gDO
 v5VhE5DW0h0xSqrEEqSGrJQdsqiFm3s2JS5lcxWJszn2a5lXtly31rHMcCLkMt3T7X9YUAZykjbn/
 rKNa2ujl/MWSVVmdYlVff/EokXD1fnsViEP2AVf9fRUovz7PUCNO0MLdSPbeXST+iNz0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgAM8-0002Jm-Dq; Wed, 26 Jun 2019 16:01:08 +0000
Date: Wed, 26 Jun 2019 18:01:05 +0200
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Is there some way to have Samba limit the portion of the Version
 it compares in a CTDB environment
Message-ID: <20190626160105.bmomcypvhhgvdgdq@inti>
References: <CACyXjPyKXCXuW2J2C=ocqYTCmhBZEpv+a_Uxd8B5V3WpvOVQYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CACyXjPyKXCXuW2J2C=ocqYTCmhBZEpv+a_Uxd8B5V3WpvOVQYQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 26, 2019 at 08:52:13AM -0700, Richard Sharpe via samba-technical wrote:
>Is there some way to limit the comparison to the real portion of the
>version string, ie, '4.7.1'?

there is a way to ignore the whole string: allow unsafe cluster upgrade = yes

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

