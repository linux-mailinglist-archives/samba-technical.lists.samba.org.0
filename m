Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24781935C
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 22:27:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Gw8R8XK/nOZq47Dl1edPCOCTiBo5b7XrHXJb3yTJ7dY=; b=nBU/KN4VpoJOjeyq8H2+7OSTSx
	awpGcLVZ6N8Joik+kUmWARO2cA79fRhwIiXxuKoE4yNHfZdmXqUHxCLLe/MEnjw6BqwTdcbBlgzBs
	fRnAj+4MpUHNLbFVuBGy92yZmDZ1gsEbrDt/VV/bJvcv6CQCRf1dVzz64azofGLzAmGlfX04MKF5u
	1/G4s6yL+gCmEfI+xvIFjmNlRdkVqeN7M2DEc07xi4la59jt4Y/sQRJqwEweFEggxbu8POv1VoylY
	ga+4fSnkF4ckCzW8M/mWF6GMKmgXT/0VKfVNxWokulx8o6uNiZZEo6NcOk8HlTWSSFc6pxO57q6XN
	kdR839TA==;
Received: from localhost ([::1]:56742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOpce-0036i0-Tr; Thu, 09 May 2019 20:26:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:29212) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOpcb-0036ht-2V
 for samba-technical@lists.samba.org; Thu, 09 May 2019 20:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Gw8R8XK/nOZq47Dl1edPCOCTiBo5b7XrHXJb3yTJ7dY=; b=fOTpOv5d2/ytO6IuLvXdH22AJ9
 FKP919qUH7AWySzcMYVsTbzPDLSpz1BfUYmHJMFQYcD8OooLj5Ynhd/ANC95Zgt3Ne4qEDEMiaAR/
 W9lctSwIgFz5w3Gtm6UPkCDuZSHNAHn7KKLfrihU4o0I884ma6IdmHHgfyuEwp0uUfqo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hOpca-0004Cs-85; Thu, 09 May 2019 20:26:28 +0000
Date: Thu, 9 May 2019 13:26:23 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: recvfile on streams
Message-ID: <20190509202623.GC205240@jra4>
References: <20190509110446.dad2siv6vvosl62z@inti>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509110446.dad2siv6vvosl62z@inti>
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 09, 2019 at 01:04:47PM +0200, Ralph Boehme wrote:
> Hi Jeremy,
> 
> I've just filed <https://bugzilla.samba.org/show_bug.cgi?id=13938>.
> 
> What do you think?

LGTM. But it also needs fixing for SMB1 (sorry I didn't spot
that initially). I've uploaded an additional patch that does
the same fix for SMB1. Please push if happy !

