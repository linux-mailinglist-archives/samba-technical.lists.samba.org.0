Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F068CCB88
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2024 06:55:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+1qRNJ8Vdsf5fcOmSC9GtqL+iSnXJZKWMOFF9aL4XUI=; b=IuOLlSi7PZIfbYic9CIxsvuIWe
	r94G2DBQ+XiQK/bd7FqiRfOTLrMME+p+AR4u8X754Emc+SDeq+7v+IOW8jmx9Rplbcp4sbjzUfP3X
	ABDKcaYn174L5U/ur4zjIyMY/Tov/I8+L6bRrD9yAsqSN7GH312t2UQl7oMBcnwacdpSJh0EpTI7x
	ZZqe9t0HQ5TJm+sML505ef25d7BTYI1T3waIe+3KKmZ3Ud3aQR1oXWDL/3NfKyJr2cNdS1MnhuT6e
	EJ+kuuWOOMMm5vvoQZ9K+0EQhIhbDZCuzgOrP4liWbYyU0BFBISR7cQxfGckfZSCTAym96Ecj3V/W
	zyjLIVTg==;
Received: from ip6-localhost ([::1]:54922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sA0TM-009hAO-Ou; Thu, 23 May 2024 04:54:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53370) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sA0TI-009hAH-FT
 for samba-technical@lists.samba.org; Thu, 23 May 2024 04:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=+1qRNJ8Vdsf5fcOmSC9GtqL+iSnXJZKWMOFF9aL4XUI=; b=Z5GYinCQFOqtbf0c0K8oj5EuBR
 1Lk/MxMgH3hBKdhR5M/leH3vkBUWs0zPHRSCfGNs74RYsH5aCfL9xUYaSoEwUvxBSujT0+BGzu51Z
 sBTUxqSOWndZcTHDmG2FU2NpJx1GaT9rcl3nY5dy/KiRgMBxpKqhKhN87Nn2VkTSa9PqRoU5+AV02
 futh58sU85SBEPQoQXX/vcRWMAq90kdZ5jrKlxCDtCzYEeEV1NXc8uzo8azM9NuRnM22lbvoiZT3y
 vYJRy9rPwMLrmZbGHR9SyzvlzH5iWlnxqWEPgpDPQFh+7N/QpKpTh/tBC5RFDL6Tnb/zKZZFJXHuL
 6m+u3zN+pX2le/BKVgAkUFzTJ2XvSSszpyRRDXUaF1m1DCix+QjkeUk5UeD/Feqo4b2dBhSqbxDcL
 QvjD0uhpL+JGWyCQBCifsotPBU/uQAG02Ccet3Ah9dSeGdkWwuhuN6dxewuXK1pzXgldYhh4sL1cg
 +5RF1l8jBssKw2sh8OFHHTMD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sA0TG-00Ci61-1N; Thu, 23 May 2024 04:54:31 +0000
Date: Thu, 23 May 2024 14:54:20 +1000
To: David Howells <dhowells@redhat.com>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
Message-ID: <20240523145420.5bf49110@echidna>
In-Reply-To: <370800.1716374185@warthog.procyon.org.uk>
References: <20240522185305.69e04dab@echidna>
 <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk>
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>, Paulo Alcantara <pc@manguebit.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 22 May 2024 11:36:25 +0100, David Howells wrote:

> David Disseldorp <ddiss@samba.org> wrote:
> > ...
> > I think the best way to proceed here would be to capture traffic for the
> > same workload against a Windows SMB server. This could be don't by using
> > your cifs.ko workload or extending test_ioctl_sparse_qar_malformed().  
> 
> I don't have a windows server I can try.  Steve may be able to try that.

I'll put it on my todo list for the next time I have a Windows VM
sitting around. I do recall testing Samba alongside Windows when doing
the initial implementation, but QAR is very FS block / allocation size
specific, so 1:1 behaviour isn't straightforward (nor is it required by
the FSCTL_QUERY_ALLOCATED_RANGES / FSCTL_SET_ZERO_DATA specs).

Cheers, David

