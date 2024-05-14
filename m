Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6AB8C4CB4
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2024 09:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=tEPNQVL3Jhw6RFYw7sY+d3pFhtnCY4PpE7hOFT6oNkA=; b=MbM0KdlWgR4Mmmz9HM1wXUP32A
	gc1Zqbzh0JqBiosJG4/8V51Iei/3v81CrrOOObQiLdzC7eVI1J2z2+CoOH2DuyqUgMCvqJ5OvqAQ7
	KFO9on1bkRsihAtwW9AlUTbn+RM7l8q+5zR/GIs1sm19Pcz7gjFTrAwlrGIIKjbyuttPY6LwiREO1
	zZcGexeQ/PBJxTrhNbzkj14IykUqbG56f5OEh/0Tq9L83hUu/4ddQvbbdIERnITJySUMAhd6oDxCP
	//CnANVKH1M2boWqvHYxansmT4oSfd0QWLUjGM6ULqo3CW9RVJKb3hOioAoxiboiqSiu5LnyQhA7b
	cSNxDd4Q==;
Received: from ip6-localhost ([::1]:38860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s6mNv-008qGV-DX; Tue, 14 May 2024 07:15:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61280) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s6mNR-008qGN-5j
 for samba-technical@lists.samba.org; Tue, 14 May 2024 07:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=tEPNQVL3Jhw6RFYw7sY+d3pFhtnCY4PpE7hOFT6oNkA=; b=h327viSsmBIE8oLT8gumIJRNm6
 iQfAdtDWPPguR76YZhPoVN39rNgTGpaEUVTCRsnYGFzIygmyQOYuKvJw2SfVuLk/BeMbm7QwyNzl6
 b541KF27DAmeXJ9fN1QKpO8ZHazQAOTT4rt5MVa3QVpC5p72zzBxjnRlDG/tcdmmwvxNxBlIBsnWY
 UHNctBbAvX1qBS/pgEe13BFIxUet8kzG+h7xYMUojBOsVW5ogPfsKZQPtmZwyzkBTPMglpp263B0R
 EmLnE6u8XyWs+2g20GwvCaL1bzCO29uGVOlffRcw/+0wwyKdOJ+Af0CbAINy4yLjLXoBBYR9WA+XW
 Wc70JRTrCZw5jghkilHcVAuPUY3C+YgqfK3At/Wlj9EDVnusweGW0k9awzvVCk7ksxg2GdlWLOErd
 de2mjRy7Sro5qE5sMoJnfaYglxrzV4tKOc3GesQyjWY9MTS+SNol4ulSWyQKMO8bDZKvOmVZGPu76
 lSughWmbEPFxJcIgtvknCJlZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s6mNM-00BK8t-39 for samba-technical@lists.samba.org;
 Tue, 14 May 2024 07:15:05 +0000
Date: Tue, 14 May 2024 08:15:02 +0100
To: samba-technical@lists.samba.org
Subject: Re: Openchange and last Samba releases ?
Message-ID: <20240514081502.0308e259@devstation.samdom.example.com>
In-Reply-To: <2708725.lGaqSPkdTl@magrathea>
References: <CAN4xyZOYsusPpMjOyUakgEsdjQQsXZRNTER-Jq4Zis20F6gKWQ@mail.gmail.com>
 <2708725.lGaqSPkdTl@magrathea>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 13 May 2024 19:42:34 +0200
Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
wrote:

> On Monday, 13 May 2024 16:38:51 GMT+2 CpServiceSPb via
> samba-technical wrote:
> > Was anybody successful in building of Openchange with the latest
> > Samba versions ?
> > If yes, was it a git Openchage version or some customized/tuned one
> > ? And what was the Samba version ?
> 
> Fedora and CentOS Stream are still building openchange:
> 
> https://src.fedoraproject.org/rpms/openchange
> 
> 

I have to ask, why ?
As far as I can see, the openchange code hasn't been updated for about
9 years. the openchange.org webpage is a holding page. To me, this
means that the openchange project (something that never reached
production quality) is dead.

If someone wants to pick up the openchange project and revitalise it,
then great, but it will not be easy, Samba has vastly changed since
openchange was last updated and I feel that a lot of the openchange
code will need rewriting to bring it up to date.

Rowland
 

