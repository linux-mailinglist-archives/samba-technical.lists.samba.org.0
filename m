Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D08F02F3426
	for <lists+samba-technical@lfdr.de>; Tue, 12 Jan 2021 16:29:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cYXPhYXazx0dURN0gHxOdVaMSIVA9rHJkSZtwIGW9mU=; b=sk/3fZkgGHUqX6gXvv7DmiTrut
	y9yYFPPeGy4N9La8A21cpHQax9PaDNbPazwdjDannOVtIKcjwUGfJiwlN0SKbfeFdecV9RXs2S6S7
	29U2oWTFuv8CkmKCsj8e/svUPBI/RVlTyiBypOWKlzoHj6wn42qDWInE5BRGK1vjb65R+lq/a+Xuj
	iTNvThDA/vldoudp3iL2YDYMylR++p4mIMt3O+Mzrr+TiBRbqpDCK80LKySJ5h0DMW9TGGCpWSd31
	R3JF0wIAG6CKTfKSi+GaPpMgUz3iBZKbNBKEI7Yl/I7vqtkHqw+ShjlKh1OSeDZ0oyVeCALk0/3sl
	5fK01dbA==;
Received: from ip6-localhost ([::1]:25356 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kzLb3-005QIK-6s; Tue, 12 Jan 2021 15:28:37 +0000
Received: from [50.194.72.151] (port=50172 helo=mail1.thewrittenword.com) 
 by hr1.samba.org with esmtp (Exim) id 1kzLaw-005QID-Jb
 for samba-technical@lists.samba.org; Tue, 12 Jan 2021 15:28:34 +0000
Received: from mail2.il.thewrittenword.com
 (emma-internal-gw.il.thewrittenword.com [192.168.13.25])
 by mail1.thewrittenword.com (Postfix) with ESMTP id 6E0DF5CBA
 for <samba-technical@lists.samba.org>; Tue, 12 Jan 2021 16:37:36 +0000 (UTC)
Received: from pom.il.thewrittenword.com (danger.il.thewrittenword.com
 [10.191.57.254])
 by mail2.il.thewrittenword.com (Postfix) with ESMTP id C1BE114606
 for <samba-technical@lists.samba.org>; Tue, 12 Jan 2021 15:28:13 +0000 (UTC)
Received: by pom.il.thewrittenword.com (Postfix, from userid 1000)
 id 912DC10806DA; Tue, 12 Jan 2021 09:28:09 -0600 (CST)
Date: Tue, 12 Jan 2021 09:28:09 -0600
To: samba-technical@lists.samba.org
Subject: Re: SEGV in smbstatus on 4.9.18, 4.10.18, 4.11.17 on Solaris
 10/SPARC, 11/SPARC
Message-ID: <20210112152809.yufxhusdhrk2ftum@thewrittenword.com>
References: <20210112133901.3kjutg6z5awvduyw@thewrittenword.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112133901.3kjutg6z5awvduyw@thewrittenword.com>
User-Agent: NeoMutt/20171215
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
From: Albert Chin via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Albert Chin <samba-technical@mlists.thewrittenword.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 12, 2021 at 07:39:02AM -0600, Albert Chin via samba-technical wrote:
> We're running 4.9.18, 4.10.18, and 4.11.17 on Solaris 10/SPARC and
> 11/SPARC and are seeing a SEGV when running smbstatus. In
> lib/tdb/common/open.c, we have:
>   _PUBLIC_ int tdb_close(struct tdb_context *tdb)
>   {
>           ...
>           tdb_mutex_munmap(tdb);
> 
>           SAFE_FREE(tdb->name);
>           ...
>   }
> 
> And in lib/tdb/common/mutex.c, we have:
>   int tdb_mutex_munmap(struct tdb_context *tdb)
>   {
>           ...
>           ret = munmap(tdb->mutexes, len);
>           if (ret == -1) {
>                   return -1;
>           }
>           ...
>   }

If I wrap the above with:
  if (tdb->mutexes) {
    ret = munmap(tdb->mutexes, len);
    if (ret == -1) {
      return -1;
    }
  }
then the SEGV goes away. But, is this simply papering over the real
problem?

-- 
albert chin (china@thewrittenword.com)

