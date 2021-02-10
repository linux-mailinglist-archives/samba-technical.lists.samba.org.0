Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FEF3173DD
	for <lists+samba-technical@lfdr.de>; Thu, 11 Feb 2021 00:03:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7uY2TbLZxRT7Qi4K4uJv2MuPTjMyncV/c4hRSVCH9pc=; b=s20vb2vom2pVEX/D6YwE3zEl5b
	izXmjueduHJX16XXVEwJPwR+q0pr4B8RsZ7KyTS9FaS7VJ032F01fmWFY4MO1BlqZD0fVsdWXR0cE
	64hM3eAP6S/fedT9DUX94ZxbA+DZP6yGpopyAeU3EloZb6Oyuve+e2LgfUdEyy7Fgf+So0769HCOU
	TSXNEkV7sKiRJv6K0QJLfzZsmDYwSKNjjH1Wpe4HYSabt2bzSOqI1kEQLax74vS4OtFPwAI0H5sqx
	7EYFfkjeQOeUzrascuCji0nbJAWBZfCWGZnDruuWwngHtS13x2GFSSsxGE8YjE9uX9dam1jeUue4a
	Z4b8ilaA==;
Received: from ip6-localhost ([::1]:44152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l9yVo-00C89q-9R; Wed, 10 Feb 2021 23:03:08 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:35554) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9yVj-00C89j-El
 for samba-technical@lists.samba.org; Wed, 10 Feb 2021 23:03:05 +0000
Received: by mail-ot1-x329.google.com with SMTP id k10so3500385otl.2
 for <samba-technical@lists.samba.org>; Wed, 10 Feb 2021 15:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7uY2TbLZxRT7Qi4K4uJv2MuPTjMyncV/c4hRSVCH9pc=;
 b=YAbBppk67OPR9E9mANibK22BtQyW2xnt9B2wWQGn1ohzi2mFiu+34YUdCG3D7ZG2wR
 MpGkCot4zkYadgbtOA12PPkJXjmoS79LDcfWSZVBncFEwBiJjvwFTd4jpQR0P4sAW9f9
 yU2nk9NQSJ6NCAUSb9YIPG90jMS8+FG0AyElv5tMJrJREssFvVbWVhb/bu36WuLV5irh
 XFCGoEjV5ooPStg+wCzmPh/6b/1yCHOxi0s6VQGg+wbXWfzRjuVejWN4U5Fic2nPEXmM
 P25pVoegCi2j9UFvCVwtUOvMhVcsPYDmUlNPvisnpFceyTzGL0I7IW+UwpaDMUF0dHtc
 0OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7uY2TbLZxRT7Qi4K4uJv2MuPTjMyncV/c4hRSVCH9pc=;
 b=q90Jso5/QMiTy3NwzKmzCgqtCmbw1s+itYi2lyVQDYaTfS7D3kxzpVyTTG80RbPjPl
 m++7CsAIixM6WqtSCDOcGWn2ibLAbDt7BF21jTQN5J76b9Gt99auLe8q6EPFNlCS1ZN4
 uRDWkKxCe6RFSrvptL/iPsXlpX1PER8VZVPLztE/sR/E90uf90e7JmrcGPW+ZOe15hWW
 1J7RKLKMrOt2P2yTNso+7/AsM2b6KWsfUXRDGCf0hsRJlHGzwAB+kVl33c2Yd8Igo/uN
 /ObWHe4xsKw22zKnN3NWXsiTEc38OLVg0URtL0gSmf56Mgxhq2ldXDeasA2fcRrtlXqZ
 qUBQ==
X-Gm-Message-State: AOAM533C4KpyaPnLz+ZEZcPrIggde46514liOYGaxCxmLBqObMAlFpO9
 Xg5YraQraK5bP1QTJy6Xb26/n4rznyWhCKA/Lv0=
X-Google-Smtp-Source: ABdhPJx8PF0qlcqbuBnbPS00U/VcIFwFsDSQOY2xvCfYia6ydvGa3cKfrvZblfF0Pk/WBhIlyY4JtGgXVr9S5pwxEzY=
X-Received: by 2002:a9d:7d10:: with SMTP id v16mr3810864otn.54.1612998181398; 
 Wed, 10 Feb 2021 15:03:01 -0800 (PST)
MIME-Version: 1.0
References: <8FA63D2B-626F-4717-858D-8DA81F2AB80E@ei.tohoku.ac.jp>
 <1bd546368a2e6567f3a43c238cb513f495bb61a7.camel@samba.org>
In-Reply-To: <1bd546368a2e6567f3a43c238cb513f495bb61a7.camel@samba.org>
Date: Wed, 10 Feb 2021 18:02:50 -0500
Message-ID: <CAOCN9rxH71Auaxc6yEJCRTGCrvRqp2Dc0ikq=d344y8aJupd+w@mail.gmail.com>
Subject: Re: Build error with C locale 4.14rc2
To: Andrew Bartlett <abartlet@samba.org>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 OHKAWA Yuichi <kuri@ei.tohoku.ac.jp>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 10, 2021 at 1:37 AM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Yeah, we have so far enforced a UTF8 locale in our build environments.

It was an issue building RPMs under CentOs 7. I had to set
LANG=en_us.UTF8 in the '%build' stanza of my .spec files. I anticipate
the same issue for anyone who tries to build it in Amazon Linux 2.

