Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291A349619
	for <lists+samba-technical@lfdr.de>; Thu, 25 Mar 2021 16:52:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=IqJlqjXqEOA/qrS5l6MiCSUm2Cp6jbH9IweDnJWlXcE=; b=dlMUJpmuDJvjNgHKoJqZwWHO5b
	S340BFLCx7CbqDrEg9tEC4va2+yTTS9DfnUfRJL1RhZ9L8uA+dLaULbe01J/LWIP3Gkvmin0SVBFj
	zkSSikzFLtu2Upnv4kpP4Ovss7tEKkopsHDRXDuM6q8X3jx286Dc2j6zerRQhNDUUZuU5yks1QF6V
	DsLEfa/SSix7CjXcewJqJ/tf4s0bIW+RWSbaEnhgrxnFTNl9p+kIq9VBOB+bZUen8BoVuAAdZAdaH
	tu4uMcWuvUCsKGm6P8pURVYIaJg7sqQtgxk1HIRQARAt120hSl4RgX14pN4J0ulVMXGGcfrmWUXMM
	3SZVg3yw==;
Received: from ip6-localhost ([::1]:39636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPSHP-006kow-MU; Thu, 25 Mar 2021 15:52:15 +0000
Received: from mx.cjr.nz ([51.158.111.142]:45686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPSHI-006kop-En
 for samba-technical@lists.samba.org; Thu, 25 Mar 2021 15:52:10 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id E48237FD53;
 Thu, 25 Mar 2021 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1616686380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IqJlqjXqEOA/qrS5l6MiCSUm2Cp6jbH9IweDnJWlXcE=;
 b=aLxrB/YSQGLjh9Vfz/LHIwd4SvH+ek1d7mB7nDoVvPIHOQ5BHd8Fl/f3zC+sDcC4ANMpet
 0Unfpb2F2Qf4PN2Os0xMMiZbJv4sNWniTGn4wSTUajdjgV3R6cF5vTyybmp0bc/7tuv97z
 p8F5BKI9IPkb6vF9oH8P0czICd4ZuT5a0vgdxalavNRU3vtri7zcsN7BBn4n5ToS7yViDo
 zjmfXy3t10jIZcRx7T078y++dsnvjn3aX4mDWzGk9G4BJYbEWPUdD0OdQvUb/ONmD0gW/f
 HoeZ+NaCF7nEfTzEjS6HHFS4Pij1Vd7uMPVYdS/5escH8fFqMGkt2AHzBXr1yQ==
To: Vincent Whitchurch <vincent.whitchurch@axis.com>, Steve French
 <sfrench@samba.org>
Subject: Re: [PATCH v3] cifs: Silently ignore unknown oplock break handle
In-Reply-To: <20210319135711.11802-1-vincent.whitchurch@axis.com>
References: <20210319135711.11802-1-vincent.whitchurch@axis.com>
Date: Thu, 25 Mar 2021 12:32:55 -0300
Message-ID: <871rc3fdug.fsf@cjr.nz>
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@cjr.nz>
Cc: linux-cifs@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, tom@talpey.com,
 kernel@axis.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Vincent Whitchurch <vincent.whitchurch@axis.com> writes:

> Make SMB2 not print out an error when an oplock break is received for an
> unknown handle, similar to SMB1.  The debug message which is printed for
> these unknown handles may also be misleading, so fix that too.
>
> The SMB2 lease break path is not affected by this patch.
>
> Without this, a program which writes to a file from one thread, and
> opens, reads, and writes the same file from another thread triggers the
> below errors several times a minute when run against a Samba server
> configured with "smb2 leases = no".
>
>  CIFS: VFS: \\192.168.0.1 No task to wake, unknown frame received! NumMids 2
>  00000000: 424d53fe 00000040 00000000 00000012  .SMB@...........
>  00000010: 00000001 00000000 ffffffff ffffffff  ................
>  00000020: 00000000 00000000 00000000 00000000  ................
>  00000030: 00000000 00000000 00000000 00000000  ................
>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>
> Notes:
>     v3:
>     - Change debug print to Tom Talpey's suggestion
>     
>     v2:
>     - Drop change to lease break
>     - Rewrite commit message
>
>  fs/cifs/smb2misc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>

