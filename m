Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEC81CBBC6
	for <lists+samba-technical@lfdr.de>; Sat,  9 May 2020 02:27:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=44MjeiNPPOzxQPfjZ7m62I4tQYK6rOdPN8foN+jqtnQ=; b=Za6zr8mOE0oYpEmkNMduF7cuHN
	v+ikdIfmnXPgoN96W8DUXfbUZVafFedsOK5XufS8HH8b4JM9MDUYNWkBQ073gsx1mGR8bdZ5pmJ0r
	UMi0YgzhBUFoYPlRfeO9pO14QHBGXSmRk/BFnoY72NwOBMM9m4Iorx8DKulB2UFbGEduUUI+fE2c3
	vwoUFtkQ3lTdaew8DpBnykNc5MvDs8C0QmWrQMijE+d35Ou3XF1lu6fsifnN05wAS0BJHqy/zqUAa
	RgjbY4BRHc6riYzlvurm6gAkVn7+MYBq4eo0DWKgDDfDioSeeZ24RwsmiIU41Q+eA7rE+cK01eTqu
	u6FXGsuQ==;
Received: from localhost ([::1]:56814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXDKS-003Lqk-RS; Sat, 09 May 2020 00:26:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31124) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXDKM-003Lqd-SA
 for samba-technical@lists.samba.org; Sat, 09 May 2020 00:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=44MjeiNPPOzxQPfjZ7m62I4tQYK6rOdPN8foN+jqtnQ=; b=boGIjDtQcPTPiILbo4oVpOPfus
 KFR155xEvzoKEaybAs5v650PlzBTb5xPt0cjWvOtRzp/y3+tPxXXV2WnhjUgWdaHF7K78qeKgti5m
 any8IAcqCndrVE5Jxv66JbRTmgbPUuvmIuMunPNxmF2QRX4taoJiXtdOdzV021W/D7UvzmUnC0BwK
 TADEPrpfQZhVAVq3Jxa242NqWjWRDO+r0kWe2fI4gqin6wJZzGrlW5bXtT/N3uX215mzc+5L3iusL
 dXssxwJ4s82exM0YaL/prQrJbmBr+7emmYKwEIKnCxtx7yqJYWXCJQA/k+0llkilZzItSu6Kr2pE3
 72BMEWMXmGRmdNTgMHtFF7W/Zr3kJq/A8T6ARr9nDrBhw1nu5jOgDiy1CQD8awNlUcYHXpO0nixVM
 lNbin9CYDBVjJKI8Un84WTBXEU4ts2znoiqQDl7wBeKEl5wkw6s/K+K3eHOOXC8yQBFEOz2uDlnN9
 hsCNc1OrOOwGDLN9Swu0ZiZg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXDKK-0002Lw-H1; Sat, 09 May 2020 00:26:48 +0000
Date: Fri, 8 May 2020 17:26:42 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200509002642.GA7657@jeremy-acer>
References: <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer>
 <20200508205140.GH26399@jeremy-acer>
 <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
 <20200508215055.GA2912@jeremy-acer>
 <9ba6f926-f0b5-6cd1-36f1-2ccdf1c8b5eb@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ba6f926-f0b5-6cd1-36f1-2ccdf1c8b5eb@samba.org>
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 09, 2020 at 12:04:55AM +0200, Stefan Metzmacher via samba-technical wrote:
> 
> Do you have some comments on the offset < 0 on write case?

I think the offset < 0 case in MS-FSA 2.1.5.3
is talking about the behavior of the interface
into the NtDLL layer in the Windows kernel,
not the SMB2 layer.

I think at the SMB2 layer all offsets for
read and write are implicitly unsigned.

I'll write some test code though, which
sets the high bit for reads and writes
on a zero length file and see what Windows10
returns.



