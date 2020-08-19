Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 369FE24A847
	for <lists+samba-technical@lfdr.de>; Wed, 19 Aug 2020 23:14:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=y2kxeQuqeED8xhxD0kQ07783tjobbbH2y6WFQGa/jiY=; b=HXmFzma+/xpOLnhDVP1QUBXeTW
	B1vB6b7rJPr4WQ8IToc5D4k8ci3zuY4FfzdiK08PSWFSG8oqMNUzQqG0tQICWvpL9LHko1En/k0Tc
	ysJHtrXNlHAoijASx39UztB3WDnGr1Mt7PV1gtI+/MKv71L0+qErUS4GMXBe1sKXJhKPhDLo249Jh
	/lWiBgRvMW894vR1a4dyPJcZaAQGWnLVGLfc06iEiAyDSV2fl9Lz1sDrTGO7E95e+RCyJjkPjZY41
	nQVn4UjRNMoTYIKddlVjVbSq2W+OsNFXO8fyCxDTOoMIAxsTThPSIMZL9UUb0r+Y9BBy1y8ineEeQ
	QTr8xopw==;
Received: from localhost ([::1]:52546 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8VPJ-00ELl8-7i; Wed, 19 Aug 2020 21:14:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11530) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8VPD-00ELl1-9q
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 21:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=y2kxeQuqeED8xhxD0kQ07783tjobbbH2y6WFQGa/jiY=; b=MYsXEyFGiKrcA0rZu5XWl1rkeL
 I4bLh/nboygv8lkklgvU2jsVo+1rfC0tZbv49JgkiP/n0YM248wDiDqXrvos5Zgq9QXUzaottF9+t
 z/C1hOC4sS2jJyQUX9wcow/2yqdEba6grb60RYovduov4nMfkFYYHskQ1mdmGKZkH1SFByxRD1U2i
 7NZpJjy9NAMmuKeA5tCHUBs4PGv3pG/feWlrbfp7poEBoaNQcD0JE55FSBhfIWh5Ta+WxoPtzylEd
 ufhrWxwbao+QjXP6cGpmYaGE5fv1C2ElRtImjCquNnPn3b0smaXFwiwxwfICcXF9C+AtDDA+Sajyl
 GvSWWHbqUM/0Y0avCyouIrm6m2WoI114OklR76jbnDVS6Nlahyqj0gqOLk62ms8LaNHwwfwmxOV6u
 jDg2pSwZsqTIiDlP5szXEnjpgK+lw+291kdqsT2SjySRnemwv8FAUTqvISSO6i9x2plwfa8Xq9aah
 c7wB2CudImZUTl1q8dpxqn9q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8VPC-0005Dk-TE
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 21:13:59 +0000
Subject: Re: WIP: Samba's client command line UI
To: samba-technical@lists.samba.org
References: <3749194.YmznvRLumo@magrathea>
Message-ID: <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
Date: Wed, 19 Aug 2020 22:13:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3749194.YmznvRLumo@magrathea>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
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

On 19/08/2020 09:02, Andreas Schneider via samba-technical wrote:
> Hi,
>
> I'm working to cleaning up the mess we have with our client cmdline UI [1].
>
> Currently we have a source3 and a source4 parsing implementation. I have
> rewritten the command line parsing code. The only real difference between the
> two is only how the config file is loaded. So I created a s3 and s4 config
> loader and that's it.
>
> The big change is that we need new options to fix a lot of issues face: The
> biggest change is probably about Kerberos:
>
> 	--use-kerberos=yes|auto|no
>
> New is that we have options to correctly request signing and encryption:
>
>        --gensec-client-protection=plain|sign|seal
>
>        --smb-signing=off|if_required|desired|required
>        --smb-ipc-signing=off|if_required|desired|required
>        --smb-encryption=off|if_required|desired|required
>
> You can find the code at [2].
>
>
> 	NOTE that this is still work in progress and no all the stuff is
> 	wired correctly yet!
>
>
> But I wanted to show you what I'm working on and you can comment. Using that
> parser will break the command line options for **all** client tools. But I
> think it is worth the effort, see [1].
>
> Attached is the output of
>
> 	smbclient --help
>
> which I just migrated to give you a full example of the new parser.
>
>
> Feedback is welcome :-)
>
>
> 	Andreas
>
>
> [1] https://sambaxp.org/archive_data/sxp19/SambaXP2019-SLIDES/dbagnall-what-should-we-do-with-our-ui.pdf
> [2] https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/master-cli-creds
>
Why do we use 'auto' ? what does it mean ?

For instance samba-tool user create --help prints (amongst other things) 
this:

     -k KERBEROS, --kerberos=KERBEROS
                         Use Kerberos

If you check the code, 'KERBEROS' is actually 'yes', 'auto' or 'no'

What is 'auto' in this context ? surely using kerberos is binary, you 
either want to use it, or you don't, 'yes' or 'no', so what does 'auto' 
actually mean and do ?

Do we really need 'auto', can we not decide what the parameter defaults 
(for instance) should be and remove 'auto' ?

Rowland



