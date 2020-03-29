Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D54196FC3
	for <lists+samba-technical@lfdr.de>; Sun, 29 Mar 2020 21:46:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=YiUKn4bb9odmb1T9cjr3rw21GEGLdLOa4IfZMYYQ8E0=; b=0EjgByMgcTyNWs6lnn/j1yJhaM
	MQ450Xqs3aymuNO9zPHzN4oOAZPVjY0UyBAOTe/mCxUfwfjwj/13Gn4g7NtBpPEi8gi1+MrImkFgJ
	n4vkgQBwwAuQUk9DaTxPr6UiplN4xRFojGtYFIJuWNLSwOHV9TYvjQuMcc7Jeq5YRtwAR+3HUKIiu
	moX2UdOUNXtiXRsXayvHrdtdPrGl6BjV7lgFrvTg31BT9ZigT2K9ROqO+XVMCF0K0RbL44xJi1P/z
	5qzdG2vO9m940f1aGcEXXBvkplmE3j9CdOFXqCIey8pXScGoXE0ObaDH8bzjDu/umfsBQnWO7grOF
	lpvf0b3Q==;
Received: from localhost ([::1]:63832 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jIds2-000xXq-TB; Sun, 29 Mar 2020 19:45:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45968) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jIdrx-000xXj-Lv
 for samba-technical@lists.samba.org; Sun, 29 Mar 2020 19:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=YiUKn4bb9odmb1T9cjr3rw21GEGLdLOa4IfZMYYQ8E0=; b=bLnzN5bV8y06PXd7+3YAHUBjMl
 BZjOPQjBAXgiaSzsffiFqjUoMyCF+Bcxr478We8TQ8DFPfoRai9uStTAJHfb/4g/TKQ/VXXzNTJAx
 DMGWMymovCDoyKf0YTuVPBgzSg9zEE9la11USDTgegoTJB77fgl7DT/uY2OW71d8Iyp74pXEWpz45
 sicb6yQFuCddowi4P7nTp69TFT1BA37MRJq/gS0ZbLX5E9iQNUEkPmsbAxhtrfaOAF88Uk9BZV6ry
 yo2qsGGxl8E63meDdO7YgCUUlA+E0jqLol6Dzu5V16b0Se00rpjY71f8p0CWSA0IViaEd4F3LJyIM
 9eSJUFMHHqB4AtqQ9Q7vhW6FXLTu+GNrf8Mg4gMJVOdjORJp/1uPyqCx0zubX1svNWsNR4oN8Gkqp
 KWlMmPYO4n7ekaxSGEqkqIS7oyPWUaLBU0HJC+kjK/8RHxx0NsRQoMJgYSGjTslT0GieG3/upRHt4
 y1ydcchnpzjjOKrJ0xByhZe3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jIdru-0005eJ-LP; Sun, 29 Mar 2020 19:45:15 +0000
Message-ID: <ca18fd4338bebc823e74de3741f0f76b4b1e4854.camel@samba.org>
Subject: Re: [Samba] Make/Build Error on armhf
To: Dariusz Bogdanski <dariuszb@me.com>, Norbert Hanke <norbert.hanke@gmx.ch>
Date: Mon, 30 Mar 2020 08:45:13 +1300
In-Reply-To: <06B7E46B-432F-4766-93C0-3E4037EABACE@me.com>
References: <0a4f01d4e99b$791af700$6b50e500$@laurenz.ws>
 <vmime.5ca5f235.56c2.3109a1736f468505@ms249-lin-003.rotterdam.bazuin.nl>
 <0feb01d4eb7a$cffa4590$6feed0b0$@laurenz.ws>
 <af43e77b-49ac-63d0-b959-63603fe1c718@gmx.ch>
 <06B7E46B-432F-4766-93C0-3E4037EABACE@me.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I would still like to know what fixed it so we can keep this working.

For example, I did work to reduce the amount of unused PIDL generated
code  in our NDR layer.  This may have reduced the size of some of our
largest shared libraries, for example.

Andrew Bartlett

On Sun, 2020-03-29 at 11:13 +0100, Dariusz Bogdanski via samba-
technical wrote:
> Yes I can confirm that with Samba 4.12.0 builds pass without any issues.  I have tried Raspberry 2B and 3B+ with fully updated Raspbian Stretch and Buster,


-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



