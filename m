Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DDC38EF1
	for <lists+samba-technical@lfdr.de>; Fri,  7 Jun 2019 17:25:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=M/GlXzTnFqzogGfQOEpySbVmO5u5CeIezz4yFrVyg7o=; b=So9DHlQegrGiLJn+sOsENo47bG
	LBP/gEG5T8wQsTKjsNTsw+KbF7+S7tMhPWtfCmmJz9tiodNN8R6VxEIZHoz8qa67WmkezQyDpimQe
	p92fBugbU1ISo4tJ0yKGKq+V+Y4Z2mjpFNA8cNh/7KJ6Mp6csnBXb3e9yDttI5wQYemkAmLbA7SFC
	XvLscCpyM3AJ7lBevBDPzDAjVWADUqjaTIcODRc5Ke6d+3B6LpTD5WC4pUI9B07NZGt2o0ZM8jflL
	NBhuvsPZOc0sM/zgp4g0cxVewXX7rJHE6/XiyX93hjMcRZF8rbILkVWjoMQfAkzEUmARyWMk9EBpI
	657Zwg1w==;
Received: from localhost ([::1]:52328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hZGjN-000Ph3-67; Fri, 07 Jun 2019 15:24:37 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37309 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hZGjH-000Pgw-Nt
 for samba-technical@lists.samba.org; Fri, 07 Jun 2019 15:24:34 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45L5st6zQ6z9s4V;
 Sat,  8 Jun 2019 01:24:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1559921062; bh=W07p09SL8mVBbyQW+yswjXBKg3ayGOBgX8OuI7BcXSY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AlnC5ZxPeuDqgFG4Q+x0Ly7sPqyeH9f0min5A5hHREV4NmOgyLIh2S7de/NpgI5JG
 utijly43LmhFtRJBtCiN2XHy1Mq2MXUhfJLxX6rA14kKEqYLfock7/SDK4iWnRVcZ6
 KomTc5DiZvAhVQSch6jXZYNYL1NByjYs0eajKo3WNMOhRy1oXyRacTg8W/d1PZm5xs
 NWqO97jC2d96yXcVj0ZXbu6kiGRno1JDanSlYVcqMq8hfTUBnzeYXxY14EiBPmKggB
 sfLnvOakJOIAv5c3g5bFv5bQH23WyDxMSILWe9V7d3B3urZBMgtLI7CiTaHYWL3gYG
 0Aere9i5Zt/3w==
Date: Sat, 8 Jun 2019 01:23:57 +1000
To: samba-technical@lists.samba.org
Subject: Re: recent flapping tests
Message-ID: <20190608012357.68de8832@martins.ozlabs.org>
In-Reply-To: <7af13c9d-858d-650d-242a-d023f19dbaae@catalyst.net.nz>
References: <7af13c9d-858d-650d-242a-d023f19dbaae@catalyst.net.nz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Douglas,

Thanks for continuing to generate these stats!

On Fri, 7 Jun 2019 22:42:49 +1200, Douglas Bagnall via samba-technical
<samba-technical@lists.samba.org> wrote:

> 16 that had something to so with ctdb:
> 
>    5 *FAILED* tests/simple/27_ctdb_detach.sh

Should be fixed by fixes pushed on 7 May.

>    4 *FAILED* tests/simple/69_recovery_resurrect_deleted.sh

May be fixed by fixes pushed on 7 May.  :-)

>    2 *FAILED* tests/simple/60_recoverd_missing_ip.sh
>    2 *FAILED* tests/simple/18_ctdb_reloadips.sh

Should be fixed by fixes pushed on 7 May.

>    1 *FAILED* tests/simple/32_ctdb_disable_enable.sh
>    1 *FAILED* tests/cunit/run_event_001.sh
>    1 *FAILED* tests/simple/91_version_check.sh

peace & happiness,
martin

