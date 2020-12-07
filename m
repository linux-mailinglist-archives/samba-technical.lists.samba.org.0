Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 153E02D181C
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 19:05:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=v+Gx5KXL0grEz7QUYKv/N8WW93ndCRHYsOrUHHk5m+Q=; b=vcysjMwIN/+IFYGoOJ5FVgd9S2
	EMVuaZNJFcZ+UZA3nJGY/lQXcfcTmJXGMUm7KGFqhNfDBQHQd8BSV5oUXYYsT6p+m+T/uaer/43VM
	Oloeb9eNmky8shUJXLtS12M9utnwW0E6sSRqFbAlhQMSlriFl8ClXJh4n5k+PhyoMaM5piMyo+hWf
	sVY8r1xUXXTpG1lsaYuCJKvXQA2+0pH/Pii8T5rB5HHOj0qmxisJOZSkFSVgOS5khiS8p7KcKj5r3
	std1Kz+R2PPSuDb4lBP+r6VGU9Xb+SnvdsSwNsVVrENBLnSAtmowZoFEpJiQh3r9VwtuSH0sY+zjh
	jtKTiOvQ==;
Received: from ip6-localhost ([::1]:45860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmKtC-000605-Mg; Mon, 07 Dec 2020 18:05:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10006) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmKt7-0005zx-7H
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 18:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=v+Gx5KXL0grEz7QUYKv/N8WW93ndCRHYsOrUHHk5m+Q=; b=VsYzFQC1QIdh1Qm9MD/yCG/HMq
 hR4jT/tiYnc+qfgueJ0Qi2ZR8Bnsw63Ep/Dvy9L3+CZhPwPRJElFDrCbaYWh+hyiNHMNBJbGd6mNq
 qzdyS8vS6zkXGkG3ZSukp8zZd3N0NvC2e5beZhsypiFrXdKBJYDDpCFdRRp5NCIJAfdUPrQqn5e9u
 UapfPVJQutVLCcfLL3N9JqwWNZktWs4JbiY5NiwPqfdBJtcjzZP4XTTS5QouGOipsVO2F/hQcirE4
 ll3cmNZU+RKxHWNcVfwc/kIPNjdlf0pjiAt5bnVQNbCEDITGrh3i8cE6Jx84LfS6x+jbSkYM582v2
 LInfEyXs4mZtIdy9K5AFAIiCZKrGSQ4lPRpL5sm/6Q7pnuKbzVx15Mm3FFCge50F5eHyZu3BYDnDX
 lsZkdRpnOINk83k6oZ6EfN1ePu2bJdP3nBxqCG/wUKkmOg40grP11cWVLdw94cF4xOP27FJ9EAxjK
 aKs7cOTGprkCBoKIN21KAjLv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmKsq-0008Ed-Nc; Mon, 07 Dec 2020 18:05:13 +0000
Date: Mon, 7 Dec 2020 10:05:09 -0800
To: Joseph <j@gget.it>
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Message-ID: <20201207180509.GD1730617@jeremy-acer>
References: <81fae2f8-970f-44a4-bb46-fb5237715070@mtasv.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <81fae2f8-970f-44a4-bb46-fb5237715070@mtasv.net>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Dec 07, 2020 at 12:58:08PM -0500, Joseph via samba-technical wrote:
>Thank you Jeremy for your answer.
>About your test, it seems the syntax might be 'seek' and not 'skip' (the
>former skips bytes on output, the latter skips on input, i.e. /dev/null),
>so I tried this:
>sudo dd if=/dev/zero of=test2 bs=1k count=1 seek=1M   # seek 1 million of
>1k blocks, i.e. 1 GB
>Do you confirm it's what you were talking about?
>And you're right, it takes a *long* time, meaning that the full file is
>written, to only write 1k at the end...

Yes, that's what I would expect for a filesystem without sparse
file support.

>I wonder why would the Windows Explorer client go to EOF first? Is there a
>way to see (on the Samba server) the log of *all* operations sent by a
>Samba client and received by the server, including file open, file seek,
>file close, etc.? So that we could see if there is a seek to
>position=2,000,000 when copying a 2GB file ?

Windows clients are trying to pre-allocate the space they're
going to need. Usually they'll create a file, then do a file
size allocation request for the size of file they will be
copying (with 'strict allocate = no' on Samba this has no
effect). The problem is Windows doesn't report ENOSPC if
a copy files in the middle - as on Windows servers ENOSPC
is reported on initial allocation.

Then they will write in chunks, as seen.

>More generally, do you have any idea about how we could avoid this annoying
>behaviour?

Use a different client. We can't control Windows client
behavior.

>So it would be interesting to find a solution to address this exFAT
>problem.

You need to use a filesystem that supports sparse files. ext4
is well supported.

>Would there be a trick, with maybe some clever use of a configuration Samba
>option, to avoid this issue?

No, not possible.

>Or maybe could the Samba server send infos when connecting with the Windows
>client saying that it should *not* seek to EOF to preallocate space?
>For example would there be an old version that prevents this to happen
>(protocol = SMB1 ?)
>
>Fingers crossed that we can find a nice solution :)

We don't control the Windows client code. Until Windows
gets open sourced there's nothing we can do here.

Don't use exFAT for this is the best advice I can give :-(.

