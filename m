Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA52F1FCD0
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 01:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YQQ+Tm9gQRtWZYhJn4gr3aa7OW2LdF6mtpVEm/R+H2M=; b=awY+ecJ3Z4JmjyYywBrAWZWj30
	gNpLO1toGQSuSh1RfK6JF0NzsdvI7Jw+xHqgK04+z24I+vTqEFS8KMwe8u0j/SEZJkB77N/upP7zS
	LSECNwEFD9Fo+QrrLA3WTl/5sRnL3TzYIpiAL7ZSxvsyKTEMeEfGKJGS1wQ/QLOcWczTfF1lhV9EQ
	LzjcBrpbpW0RZfkOLKIAelrJYZQgj7VRJzEvrxX4peBC5OfiOqaYWQyxQb51O2/usV/jJmTTSyy+h
	aL3LSk/kwLumGaDwfFZ4PyhktS4fRnyX0fiCr2fe1PvNNNilvAyqM6DR2j0jLpseSs0NGvAjOEdNL
	t33qzmyw==;
Received: from localhost ([::1]:42434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hR3jz-003tLI-RP; Wed, 15 May 2019 23:55:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:22466) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hR3jw-003tLB-RL
 for samba-technical@lists.samba.org; Wed, 15 May 2019 23:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=YQQ+Tm9gQRtWZYhJn4gr3aa7OW2LdF6mtpVEm/R+H2M=; b=v/iUCVJ7/6PgIKIl827T7p3Lnw
 qb3U8c3Tkh/PsMfxEqjM7xus5Z2+VLjBfZZUsxf5NK8nGUqYDsPDRGnhgoP2R/0GM7ZAom8Hd0yCw
 HLKMbbKWhI9BDukRc8aOzGfTNbfNuR7u/VvQyRBewLO2k9CYb5n+OuA+hoNIME+xs+S0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hR3jw-0002BO-7b; Wed, 15 May 2019 23:55:16 +0000
Date: Wed, 15 May 2019 16:55:13 -0700
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] lib:util: Fix tfork return value if sigprocmask fails
Message-ID: <20190515235513.GG253468@jra4>
References: <CADRDgG5Oh2GfCzrzZzHDhD6nzCqCLgctptdK7-stYqjwsOp96g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADRDgG5Oh2GfCzrzZzHDhD6nzCqCLgctptdK7-stYqjwsOp96g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 11, 2019 at 09:31:44PM +0200, Rikard Falkeborn via samba-technical wrote:
> Returning a non-zero value from a function with bool as return value is
> the same as returning true. Change the return value to false if
> sigprocmask or pthread_sigmask fails to indicate failure.
> 
> Detected with the help of cppcheck.
> 
> There are a couple of similar issues in the source3 directory, I wasn't sure
> if this directory is in use and if it's worth fixing these as well?

Yes it's in use and thanks ! Please send in any fixes you might find.

