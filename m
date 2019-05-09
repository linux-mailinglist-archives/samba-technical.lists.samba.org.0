Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id A659E1959F
	for <lists+samba-technical@lfdr.de>; Fri, 10 May 2019 01:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=VMLJrwIjRyou/sc6ebVrWGyJEPcF9ornni9W329ukKs=; b=nZmamy7lBZpFj1I860h5fe0RLD
	IYdx7zj1TS+1Fj1P/Na31pWDRbj0pwLt65LagdFWsfpVUcVdnDqjmYkZpEQXPr/IX/CiHCXGJxFj/
	2pTo6t1QdpCJcLaHTbY61UZVta4HPTx4niejOFGcA6rQrMFJmqEWYtRAaOfH9ToM5ACOSBnlmql+H
	TyxPdzUtTX8xfb+/0rDRm68wPTDpmMyCboJ38cqvz/ZNu3kOrvCvA8sBjtmwid7GcpwIn4x0VREzp
	z+BufV/gjIQn+bJOA9xCtgvFN0ihuo4TbQ+nzXVWbDCG+DMelMFfKNG92hwx7L/1U6fNpVcnfvkYK
	ddQMtz+A==;
Received: from localhost ([::1]:59246 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOsKY-00379H-KW; Thu, 09 May 2019 23:20:02 +0000
Received: from ozlabs.org ([203.11.71.1]:53987) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOsKU-00379A-ED
 for samba-technical@lists.samba.org; Thu, 09 May 2019 23:20:00 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 450Tnv4n8Jz9sB8;
 Fri, 10 May 2019 09:19:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1557443987; bh=mwcOzvhG5MFCCobjpLv/4iNmFPe0WiBRyFSCJxP6WoM=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=plHXoTdHx6bCj4l20Jb+hBJz23POV8iYtAnFjQgUaOptC7wHnyCv9C7PKsYoSZaMl
 mcsnBhuz48hzKuY1B+jXp7XoqL88+FBnI3GqxEWjWZ3yik7+ongZlFWDmuBUzC619i
 9l6ppk3Aypx00EMSjxhIV3Ds3gMmclWtHUBXdya7lo35VyankLhgBQAcgqrrOQ08jM
 3CVImqnawsPv619VnXbo/Od6QX8ZF6zxgOizI7NBCLYa5hlE+I/IrgTN4G9pfbHYfK
 jvJm6gWy7k4rzMFraHjDJLaabA8q/nOO9YYn3oV8AZsTMTIfv9qjebSaOc+tsBXeRC
 pTr9Fo+XNKkFQ==
Date: Fri, 10 May 2019 09:19:43 +1000
To: samba-technical@lists.samba.org
Subject: Re: [PATCH] ctdb-tests: Make reloadips tests more reliable (bug
 #13924)
Message-ID: <20190510091943.679a9cf0@martins.ozlabs.org>
In-Reply-To: <20190508113114.2f6ff9f8@martins.ozlabs.org>
References: <20190508113114.2f6ff9f8@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 8 May 2019 11:31:14 +1000, Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:

> The "ctdb reloadips" can fail for a few reasons, including
> colliding with a takeover run already in progress.  This was a
> simplifying design decision.
> 
> The tests try to be careful, but there's a startup edge case where an
> unexpected takeover run can be triggered, though it has been delayed
> for a quite a while after startup.

Please hold this for a while.  This is still failing because it isn't
retrying.

Amitay, this is almost certainly an issue with matching the error
message, which you queried the other day...

peace & happiness,
martin

