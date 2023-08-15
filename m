Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811277D213
	for <lists+samba-technical@lfdr.de>; Tue, 15 Aug 2023 20:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=kJjeneACakyjixftgTs3skIu5CB0b3rHbi9cca9HEnA=; b=mdGeR4dl4WHuOR+ifPlHaTS8ja
	rGVUT3yPBqbpsEfTeiCVEvwk5Ce0I+LZQjcoIaC8v58biQT9O1FF2Q+EiJEl0YbT8F0+p/1gLXdKp
	mVRH12IqKoE+wrxpvKBKSiHpwgqJdEnk6OadU/9VjT0bw15RJV7OYWu2UPOGxencOu68sausk3HJU
	aeLfujEc8SZWeCxmLS/yWPaKUEmlSMzIjZEsU7mWRlnnJgLtPSnwM9pmE0JFkMKUYILjqZweiFvAe
	s2XjoGpB60dzxym4ucfDkiR5ouZ0GnJUJs99fFKXuQXumhzhEvYBQJ8Y2xQjgtUEaEgZ1sMcgpMUG
	joNQOuFw==;
Received: from ip6-localhost ([::1]:42656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qVyyH-00CKhm-6W; Tue, 15 Aug 2023 18:40:49 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:55082) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qVyy6-00CKhc-HT
 for samba-technical@lists.samba.org; Tue, 15 Aug 2023 18:40:42 +0000
Message-ID: <2f7522c01a45f9052f423869040258ba.pc@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1692124835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJjeneACakyjixftgTs3skIu5CB0b3rHbi9cca9HEnA=;
 b=FJZrpg01mrmsoPHkhHAzaxo7ZZ55i2jvKk8EBea5OB1Cs9dZR1rEnUQ9wi6LPFJBGUw2UV
 qzTNWHJefPmnrYbNk5hPeEaXR5iojvWA6SsP8lnHJRuQDlR4SIcFNv23uhmU/9EwJUcjF4
 Yl/YfPlXTmPqco74Oy5eAu2j1Dfw/eWsnRorHz6zDU78VYQ2qLJJ0Y53glF9r8UjGa4KAw
 xVR1qE13dfMrFBGTuEtho0moZYXkCzUraMbo8neevW1vAoWd0y8CLFKZKRRvgveP6rMjgz
 kxRWeJ5IGB1j/ZmMFcJnlOg20RB4R+0Ip6pDTtohUZnSoThY+SdFOrc4LuCSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1692124835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJjeneACakyjixftgTs3skIu5CB0b3rHbi9cca9HEnA=;
 b=sgEX+zMm0KwH5JY6kJgT6JypLxG8sTkznUdSMrwnfUCaGP1xTGHOP9NCtS7QEUa9ysWs/G
 eMkpfm+idxNpqwLrb6hswiFK5FVm3lvnil0Kqogs1VjIGy4attoobcwjdlwBI2qCvOwZog
 wWc5c9uoG/93WxGNxPZx+heYgB/hq914XiFswmtTuttvv17i1KikCisEAPDcR8vUPMA5wc
 N6fab/v2FGj4GEPFsTUwrK+I0XONhI7gIuLztzYtGtlz9lyur+bQCfoBl3uh3zQw87WHrG
 t4CUhZ8VpcVfXn4a4j+xYdYfWgRI5MPSydj4o9F9JrNceITChMTc1VqqcCJ+dQ==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1692124835; a=rsa-sha256; cv=none;
 b=P7ahnPAeRIxx8jwOwFDl4P4LAVclIrqIsNrDQd9Dbu40taISzxiwSS3jHpGXNj63wCNqek
 UIJoUJ+2VFcCQVxwOZEbU3Rk38rx/EFd+pcT4UCH2dxED0G8V2eQyT3GDuC8kkggJ3u+H4
 lQi4q2Gb8n+yBz076+VBcvrk50DzminobmKIXq+yLpckXuTrRcGrZ6thDpCV5/qoE/bjux
 NE8hYVfRAaQiVlZvYuEtlsfSEM4ZBt5/pfipOYDBSH4uyfuVgYA7qDWV7CCblzHDIRWJ6w
 hIGtX/hFRzqQJHacVAZTu0SnspOd4/zvsBLejGAcBb3+KrDExvFZwgQTYKTXKQ==
To: Scott Mayhew <smayhew@redhat.com>, Steve French <sfrench@samba.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>
Subject: Re: [PATCH] smb: client: fix null auth
In-Reply-To: <20230815-fix-cifs-null-auth-v1-1-3cb785216d97@redhat.com>
References: <20230815-fix-cifs-null-auth-v1-1-3cb785216d97@redhat.com>
Date: Tue, 15 Aug 2023 15:40:31 -0300
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
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <stfrench@microsoft.com>,
 Scott Mayhew <smayhew@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Scott Mayhew <smayhew@redhat.com> writes:

> Commit abdb1742a312 removed code that clears ctx->username when
> sec=none, so attempting to mount with '-o sec=none' now fails with
> -EACCES.  Fix it by adding that logic to the parsing of the 'sec'
> option, as well as checking if the mount is using null auth before
> setting the username when parsing the 'user' option.
>
> Fixes: abdb1742a312 ("cifs: get rid of mount options string parsing")
> Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> ---
>  fs/smb/client/fs_context.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>

