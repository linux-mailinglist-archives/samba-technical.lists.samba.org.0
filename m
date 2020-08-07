Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D8F23F159
	for <lists+samba-technical@lfdr.de>; Fri,  7 Aug 2020 18:38:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oqw2gWuG/UOqpgEytvtyPzXsYqy27GMJFC4D3fWWXAE=; b=piMZnG2m5B9pn9b9yLU/mi9qUc
	4/YkSnPCJqNQx1yJdlAZOtlVJQILDB6skGoCN8qfZe+ZRCXMc7hpScXi4J2dh1EqXKDOEO7qtKFVc
	XZ2oVrlRzpw2s58MME3piz3jHm2Y2jFXQmfCg+wBSjA6jrdl1jrahtn1CyPoAFPsvCDN83U14new6
	TCwdRQ+MOqIUGBKHIlC+oDaAy2grxaiTFcZyWZB6NTTVvVhhHNCNDqnTWHDxXiuRzMc+TD7nyGQqs
	ElVsXt8q5gPGf0eUuZN2v0SMDIMc9eA/GhvwJnR4D1aoxUc22t7UdqB94xfnU/RY418UWWB6Xyboi
	Pxua21SA==;
Received: from localhost ([::1]:62848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k45NV-00CnY7-UO; Fri, 07 Aug 2020 16:37:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35614) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k45NO-00CnY0-US
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 16:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=oqw2gWuG/UOqpgEytvtyPzXsYqy27GMJFC4D3fWWXAE=; b=4AZGZUME+sdTKwBr0fKpFlqn5M
 i0gJLCSjNZcLzqZkptBVH4IXqbI1Gyb5jf+rYMTay0061ZR0xNvxJsfeylqRGqlZ/ajU9daaPr8Jv
 6jZ5pzexh2QTUU5zG3VAJK1XCpe2J9Fj3kJ3oJl4wj/q620TQskNdnf6sei9HlzTifDWAb2G1sxCk
 F5kIoNJ+iDfhc1nj68Gt5Ehs8Vfij/wuKGVNbZrXbMXUswYakH8iFRuQduhHUyVdTGbMJoVR9p/5x
 gQrWX0Zllqlx4OT+C53xIG8dTrakC/ESOJIDL7U6fUSnKtaeIrY8T8dO0F6fFn4HDu3IOa9NcW7s3
 cnKfkd+oHoD1Poq7Ain3XKBjz6hp+ZHyambhE0Buj+S3+/6j3NOYkhTAiHTCTaMbQUBnx+lslDW6e
 SrTkGNPw6AMMjUv7Nor4RDK6RqtzxzaY3WCVe7yzFszrUxLbmV/BMJ1PjBOZEAk7hcvaXO/MG4Pbp
 tHvjRUnsIonWqncnST7FhYeT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k45NN-0006Xj-Dz; Fri, 07 Aug 2020 16:37:49 +0000
Date: Fri, 7 Aug 2020 09:37:43 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: S-1-5-21-Local-SAM-SID-513 -> LOCAL-SAM-NAME\None
Message-ID: <20200807163743.GE6866@jeremy-acer>
References: <83e89636-75d4-547e-c93f-4184da64255b@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83e89636-75d4-547e-c93f-4184da64255b@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 07, 2020 at 06:25:32PM +0200, Ralph Boehme wrote:
> Howdy!
> 
> Can anyone explain this little peace of insanity?
> 
> <https://git.samba.org/samba.git/?p=samba.git;a=blob;f=source3/passdb/pdb_interface.c;h=03aa4ff8472198a4600797073cbcc97b5ac93467;hb=HEAD#l1840>
> 
> Cheers!

OK, what it looks like is a call that can *never* fail
on Windows - e.g. looking up S-1-5-[LOCAL-DOMAIN-PREFIX]-513
must *always* map to "Domain Users" group.

To make it not fail in the passb we map it to the name
"None", so there is a valid name to return.

That's my guess anyway.

