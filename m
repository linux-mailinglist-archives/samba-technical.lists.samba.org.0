Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FF736EF43
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 20:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=m27bKz1gcuzn6BCEPK4D8rW7h4zOdLly/qmkQfGVlIQ=; b=3jKT2v02JPTY2vPg87ros8dTKa
	56ahCrCeFKS/9iKLlMi7Kb0FgMf8C6eoY4vA0szWBYIWR9W4ep2rvvxFeYbp0XlQnUGeymHrar0R/
	QRxcePBT6gEc2fos3JM+Zoc97EsalzmSlSXB35emLxQmrWgyJJQPUvH44YCmKzCLsIXCjR4KDswut
	gt9IBpUy2KSqPUiS7TdOVBVW46zrEiDKTYkfNuYFmdFMhFL/jR8sS/t5yU+tIpzTjRZ3YgydTuU4Q
	J6aSQzUB+5feNfsw+FW5Xw7m6s04SBuLQt/yD3yGNYMXD9osuCQ86IgMu+NU0tx9SxNgX6xBnv5PZ
	uOfP/nDQ==;
Received: from ip6-localhost ([::1]:32544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcAyq-00DFXD-Lh; Thu, 29 Apr 2021 18:01:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54350) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcAyl-00DFX6-BM
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 18:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=m27bKz1gcuzn6BCEPK4D8rW7h4zOdLly/qmkQfGVlIQ=; b=3s5iUT8kVTlmLCUTUJYAUY2OcI
 w2M0KiKN+qMarooL70Ld1UJwgH1kJHakcAJyqs6p0hMX7JnXLlGMw9BnsE/ot9j7/WbCUlrOL+ipr
 m2TEv51HOlufzS1N+w2CJTQxGNQMmJSPFN6Mo9IJJUiCSjWfc+uSj8bw+fbrAbRSiDkliHkcyX8nt
 bfSDGpK5dc1d6pdemP7VK1yo5HAuRoRt0BFUCtrVkuQiFnvfIEd6MxS1pKE/XzxkVeOFDvtFnfaCp
 FFEvqPmuHYHRnnltQ2dbk1t7pPDk21zwqdjyYdEO9YAYhwHvYttDpJW/LOIIRFq6hrp/dZKeQIWzm
 RC/1l1HR9bt5cPfn8BxMuR3iUEsKDBL8ORBpPf/gfhRIgKEEDayTDf+pZsaxWzDKd2fl59mWerVm1
 JNZbUKdIyrwPM+jmGJ77QaLxSVprGo/GJ7GUthjfO8kxozKndMqCO/aqeT5Whmz8Ke/L3xH5oJrCJ
 Z1eWrCb4Rwp/8DLXgtKXZzof;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcAyk-00081V-5n; Thu, 29 Apr 2021 18:01:34 +0000
Date: Thu, 29 Apr 2021 21:01:32 +0300
To: David Mulder <dmulder@suse.com>
Subject: Re: Ubuntu's ADSys
Message-ID: <YIr0fFK4RKdUgrF1@pinega.vda.li>
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
 <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
 <RCZBSQ.RP64LWX1DB4B@suse.com> <YIrXaNVMOKnOCt+3@pinega.vda.li>
 <302CSQ.K437P63P8WCM2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <302CSQ.K437P63P8WCM2@suse.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 29 huhti 2021, David Mulder wrote:
>      ALT Linux folks also have a comprehensive group policies parsing and       
>      applying tool[3] that relies on Samba Python bindings. The tool also       
>      exists for several years and will be present at upcoming SambaXP.          
>                                                                                 
>    Igor (from ALT Linux) and I have been working on merging their gpupdate      
>    into Samba (combining it with samba-gpupdate). Their gpupdate has a lot of   
>    cool improvements over samba's version, so it'll be nice to have all of      
>    this in one place.                                                           

Those are great news, thanks!

-- 
/ Alexander Bokovoy

