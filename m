Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B7624BF66
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 15:48:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Leb0tNzD1g5nJt/7VeqpkZ1rAlfc+szY4LJdEYjcCoQ=; b=Tf2oZemNWZiKVu8bqM3lmO1CBa
	QVAcPM3SINmTraUUvL71nkJphbqcDtNkbIekul4xbOgyjESM0ff6FBjZVnUVhI4nWxN7He8rQICGp
	a0o88PM87AoWepwG7hODyIa/KKEP0de+hzalGMLEGQ0/3AC+jjmGzSfOocba6OdygnNbQvVIBO4wD
	hj8wTAkgWAE/Sd0Vbu2HT2K179B7AZbaxy8gbRIWXYGPSgWt3Xz8j08yyAC8cutlCLDK2GIuQq2nN
	8hsD08j+tdhi7j3L1/2rGWuwvKQ51Srh9IuFl+Nh7v4LtrM2W0fF0vBPauvELWIvZtvfo5C8drnTd
	jxCGNOAA==;
Received: from localhost ([::1]:38258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8kvA-00ERbZ-Nh; Thu, 20 Aug 2020 13:48:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47836) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8kuy-00ERbS-6Z
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 13:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Leb0tNzD1g5nJt/7VeqpkZ1rAlfc+szY4LJdEYjcCoQ=; b=q5YUoZglq4GjUG0XwwFRNZhbIQ
 0SuyoUqk0pVEDJ4FL/ldlf07La8X6Vgd4Wbza0Wi92fSEMFsv10BUzcdhPn1n9S3XWQ3PA7X1Sg/a
 3d62DMUUiCjbTyOviGu0K69RiVFsX2sj0O8t5j0KOeahpLu1x8foUmHU8x8L2Lri3bTfQCDot3XYf
 Yvn5a839TrxZNyBz3HK69akRwAppLjTdErrp5eRimgQbczEpX4WGI5b3tW+fSR9s/P23EkEYr9CJi
 uQt5GHQWdY+gLynYDg43b4WZpEhj/fwR5diOzmksdwROvKQ1D8sH7jJetuWvnAFtFZkyWZXF60yDx
 LANzLqzAjPGqKb1DdEfyAPGpJ3rLIEDZpTDVRUxomJxSUvxDWZLt8jJRDOUhgFvt2MEq1M/n+0CqF
 oKh8ElyOLq3rnIVAGooTqfpYZCQ33a9NHVY11kkCE8n4NHfWIoUqsTJPFtzXqMxx3uO90tL6ByE9o
 hDlyqRu9/cX0tjSOfXDLg5j5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8kuv-0004v8-GJ; Thu, 20 Aug 2020 13:47:45 +0000
To: Andrew Bartlett <abartlet@samba.org>, Rowland penny <rpenny@samba.org>,
 samba-technical@lists.samba.org
Subject: Re: "auto" for Kerberos, a history
Date: Thu, 20 Aug 2020 15:47:43 +0200
Message-ID: <3725639.4cj2GZs8Sr@magrathea>
In-Reply-To: <77d759fc-c299-21d6-fe5f-3a673dd4f834@samba.org>
References: <3749194.YmznvRLumo@magrathea>
 <4c9267080ddc3cc0ab3a20472db4c28135356a74.camel@samba.org>
 <77d759fc-c299-21d6-fe5f-3a673dd4f834@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 20 August 2020 11:19:32 CEST Stefan Metzmacher via samba-
technical wrote:
> But we could use "disabled", "desired", "required" for kerberos
> as the main values.

I've implemented that now.

I also think we should just have a:

--client-protection=off|sign|encrypt


If you need a more fine grained way you can use:

--option=clientipcsinging=off
--option=clientsmbencrypt=required
etc.

We can document this in the manpages for the --client-protection option.


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



