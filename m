Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA475F0A89
	for <lists+samba-technical@lfdr.de>; Fri, 30 Sep 2022 13:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Nr8+qI0FhmjZZzhb16WwStdz+kyRqfAZVgluKAEANjg=; b=Tkw2UlJ9CyrzrZZktIH+PgpqqP
	6YF1fJAcW5aJKUjDHcGX/Vzeil3uK6yKiLbYUn/NvfurGTRX9LesBL/4g4bsEwI3/bZCD9dCr6pUc
	3R695Sg9W7sL0L9Tc1aCz/rODqOMW8AbsbViCPJ2CBEujtXZiGZ/7R4PzfAlZgcxFXKcJ2kGVD+3Y
	ufIPEtMCB1F/vo5KM1gDILfAij4n07sEH2ZDa7HGbT6SYTFn9mjQOiv3aWmFV5B54B2SdA28fqdP9
	rOJvDN+OdWzRy6YTvEax7XnLOIVR7UZGzm2g06JvamsOjKn8MsYp4DwCz1FtiFm22chNtAT/l/yGF
	rOyX3xSw==;
Received: from ip6-localhost ([::1]:36874 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oeEFD-0051zy-R4; Fri, 30 Sep 2022 11:31:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35374) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oeEF9-0051zp-2Z
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 11:31:49 +0000
Received: by mail-ed1-x534.google.com with SMTP id c30so5595916edn.2
 for <samba-technical@lists.samba.org>; Fri, 30 Sep 2022 04:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Nr8+qI0FhmjZZzhb16WwStdz+kyRqfAZVgluKAEANjg=;
 b=pi5IWmvDgvU1QoEArXrb+mdNIDpCXhHHsYgko+pXUDx9lU5g+ifTIWmVps0sKlMu+r
 8W1pxc//f3GhK1dgl/ls++bFRnEVfdvWp1I7GTT4llHyJxcYLaRtsB2Q8rur2O7pikUO
 oeIcpG/cIZ5XTKuv1KEGC4tb02e3OEJ2cMMGeJMuS5AE0zMhCGwebkK4/n+IBqVKqy6k
 khb0C9l6+02vD/sRj6bLrbkh4C/bQ29utp7acA0xmYdcOGR2IjQrOeN3XfKAWR7AqEa3
 PYwsCGSKM8f9yFOxvuKq7/OGOUjQValtKMzrguCIQgEf8xR74blkY/BJSSsKiFKOGmL/
 CIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Nr8+qI0FhmjZZzhb16WwStdz+kyRqfAZVgluKAEANjg=;
 b=mhAJasrWS5SX3tjRUkKyfwhZx8jH/eMW+2WIO6iCp04tKl41Eb2uNvN4A6Hd9EO8gj
 oEzVLzJvSWSNYh3QNQX9jpT7K70uOn7Ln4t86oTviRe+jpORMyj2n5GkbaedkyUHjB5i
 c7CjO0+DPtA44JmTV1OZN0ucl4pWJtNR9JbiaYvLX2RQ8jZlozqSdCkjlJc7qOnrUT5Y
 sFtrgbWPoA2AKvN5n5/b5rhPhdyk8WxA6khTjRG9e2MGGbnhUdXWHFgTRjN4Jq7awdmJ
 XcJ4bEADXfmq0bPGb4ARNifVg2R9thcDGlj2C6BzPidw7btZLWGtV/ZgOwRcYwgEhNyM
 NO8Q==
X-Gm-Message-State: ACrzQf2lMfZcs4PP4AGqdvVIuVfA1FIM2SvUY9VUCFpij2DaPKQZ5+x9
 DMi0hHjbQGYYlYQPHeYH7WECg7m2/kbaVJm3ciQYad59
X-Google-Smtp-Source: AMsMyM54g3u/TP/15KxECldseWkV7ANLhWngsP6x6sGx7RDu9BtgGdGGp5Wydxb9hEqleCAW3UVCnK0JssaeeBdZBL0=
X-Received: by 2002:a05:6402:298b:b0:44f:20a:2db2 with SMTP id
 eq11-20020a056402298b00b0044f020a2db2mr7574259edb.138.1664537505977; Fri, 30
 Sep 2022 04:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
In-Reply-To: <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
Date: Fri, 30 Sep 2022 21:31:33 +1000
Message-ID: <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
To: Isaac Boukris <iboukris@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 30 Sept 2022 at 21:12, Isaac Boukris via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Fri, 2022-09-30 at 14:26 +1300, Andrew Bartlett via samba-technical
> wrote:
> > I've been trying to chase down the CPU spins reported by our users in
> > the writev() codepath from our LDAP server.
> >
> > A private mail the the strace output shows the sockets are in
> > CLOSE_WAIT state, returning EAGAIN over and over (after a call to
> > epoll() each time).  That alone would be enough to keep things
> > spinning.
> >
> > But they are being shut down, however our LDAP server won't be
> > triggering a read any time soon, it is waiting to flush the response
> > out.
>
> Why wouldn't it? I mean why does the read waits for the write? if epoll
> says so then we should read, then we may detect that the client closed
> it end and may decide to give up the writes.
>
> Technically, I think there is no problem to write to a socket after the
> peer sent us FIN,

I think possibly the problem is that IF the tcp tx buffer is full, you
might get -EAGAIN instead of a better error
if the socket is only half-closed.

> it just mean he closed its end and won't write no
> more, but we can still write until we close or he/we reset (as is the
> case with HTTP 1.0).
>

