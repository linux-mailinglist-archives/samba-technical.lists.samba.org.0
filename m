Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF68F36EB6D
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 15:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=d/CD1MaHr/87+FMJeIS0zs3lBihms/imOk2AkiJlJs8=; b=nUYWB5G7eg/s8jXr6hdJuXGvBy
	o0Sk3ah6BfUw1EGcDDb5yWxNnQa8lfvgLlJwVcged1gs772R3DYNROBRwbmUkz+XBfmNOBTU/gz3a
	4lWVjvQ7Cw+13Z9F8Je123w4bpXt/PaQJkepsX8ZjceAtmehIurYmEGrdUxW4kf3A4gnSc4mjufOk
	ZBShOkg8lyKnG3pfu/zd/hVrN1IlqjG4gTm3ZvaYkbQa3g6zlnW7VHgWI6+TPCGhoWz8z5/RKiD9+
	d1cxXBss0IkOabDCeztZOpIjNc/qMTtqn+PuX70cI9NIguSPKDgxDrASyAU9dZlmnh8KBIAM9gWoL
	wsPtNYRQ==;
Received: from ip6-localhost ([::1]:44254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc6t3-00DACR-Gg; Thu, 29 Apr 2021 13:39:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23056) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc6sz-00DACK-1h
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 13:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=d/CD1MaHr/87+FMJeIS0zs3lBihms/imOk2AkiJlJs8=; b=rPpO2zhRi2ATiq5J4CrU8R1vnx
 oMlcC4vuHaXHyyaSd00f9uc12WHqqSILnr2Tn+fGeYriIvt2P5K+4Uk49ai5zsFIgluGmTGeq6SbV
 hteEYvEhhAL4oLHnLOmxRVHSX19IFPOXis/lELtaSMX59A/SSG7UKG/WyR8h4eNRnP02RDkH4nX2H
 J97N151Hkw4kjlFPbCFPSiNNryej+Q1BylYx+jEfarjVkWVC+M6OWY4tSXwjRsAI1Ga878rQmwIVc
 EZlUnIfJqb9Y6bXhwOp9dEjxokOztXicQ5SXMkth/mrWtjcYgPFDc2YKw7DXEQVgLY6wdGkOpfMcC
 V7bRO41tIO95UwbSKLf3WOTXXW4cD7hytCMxpM0vcnDFcoVIejANp5hCEjXPwU0nUjG4Zf8zK/yZs
 bboaifkB5Qr+aqoYjgaNZeUlLGvwJ/Li0Hs/QKD/o14UM3/3632FLl2AMmYDpSFrceJ/aGF+hn/FX
 Ymq/6YFzgfLPUryeaPKpfI86;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc6sy-0005BP-Hf
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 13:39:20 +0000
Subject: Re: Ubuntu's ADSys
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
Date: Thu, 29 Apr 2021 14:39:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 29/04/2021 14:22, L.P.H. van Belle wrote:
> Hai Rowland,
>
> Do you think its usefull to have it in Debian available?
> And if yes, ... Well, you have the fix ;-)


I was curious why something that had just been released with a big fan 
fair, didn't work, so I decided to find out why and, seemingly, I have. 
The problem, from a Samba point of view, is that it depends on sssd, so 
precludes the use of Samba. If 'adsys' can be forked to use Samba, then 
that might be an idea.

Rowland



