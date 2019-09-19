Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 26401B7209
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 05:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=sp6LSSFBj2QKMuJpDykQU4wKNppX88hoa32zHlRQnBU=; b=sQLvSZARdk20g5HZ5S+N1X/bsb
	BKefu3BG5vdq38rg8mvOOGrCdlXujoKs3got0nPAa4VP8vYj9H4xfplAcK/R7t6uf0dy4mC9xGIrx
	+zqCWR8uuPoiS3w1bpDJ/gE5HOwPy/n8TCmdBDru3A0qud4pMF1EoiZ8jiso9vFQuEKDaFU813NhG
	gw3wOvxVx4LtHzESkn2AcxHk+YEyf6grNarjppSRELxBIqumKaPq3Z4A1nBuv9jjd8hBnnWEcauYm
	If5w/ZzfWMfHkFRsxavdITUPvl8TWeb3VyeMXmozV7rQ4hbwcjI2+NMpygznikZUlib53fisZXaTY
	I/EWYEug==;
Received: from localhost ([::1]:53824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAnYo-006lQw-K4; Thu, 19 Sep 2019 03:56:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAnYk-006lQX-Ck
 for samba-technical@lists.samba.org; Thu, 19 Sep 2019 03:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=sp6LSSFBj2QKMuJpDykQU4wKNppX88hoa32zHlRQnBU=; b=nfjNRlePqlGmcYhMepHYj23xRH
 W2AznBfM6EgWY5cmHSUvd47m/u9+gbnlZ1c0JhupLztVGENP0eI5Z7vLPCDAEHn5CWc1nM7dDcOeO
 FN09gDsjwoemndh/bcxRoclwAM6l9rqyLDs82XiZk/wtsrgoyKezu/BpWZ0fWItd216Q=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAnYj-0006OE-Ry; Thu, 19 Sep 2019 03:56:45 +0000
Subject: Re: Sites and services and queries for SRV records ...
To: Richard Sharpe <realrichardsharpe@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CACyXjPxh=feYNk3o=DWxQN5xc4s8T5NNffoi_boTck1N39Rx8w@mail.gmail.com>
Message-ID: <bc4a6b06-66fb-bcd2-a895-72c77c482805@samba.org>
Date: Thu, 19 Sep 2019 06:56:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CACyXjPxh=feYNk3o=DWxQN5xc4s8T5NNffoi_boTck1N39Rx8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/18/19 10:18 PM, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> I thought, perhaps naively, that if an organization is using sites and
> services, and you do a query for SRV records from Site A for
> _ldap._tcp.<realm> that the Windows DNS servers would return the SRV
> records ordered with those for Site A first.
> 
> Is there more that you have to do to ensure that? What I am seeing
> looks like standard random round-robin order.
> 

The authoritative info on that is in [MS-ADTS] "Publishing an locating a 
domain controller". Central to that is the "LDAP Ping":
- In a large domain you'd get tens of DCs in response to your 
_ldap._tcp.<realm> query.
- You'd then send an "LDAP ping" - a UDP packet - to a bunch of them - 
Samba sends that in parallel, hoping some are not blocked by a firewall 
and will answer you.
- In the response, the DC indicates in which site you're on
- Then you make an SRV query specific to the site - 
_ldap._tcp.<site-name>._sites.<realm>

https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/8ebcf782-87fd-4dc3-8585-1301569dfe4f


