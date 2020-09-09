Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A2B263091
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 17:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Q6imWicjvSC8iRnUfl0na+ChV5VpbNkoPBEkONb0j0s=; b=M6QzS8PtPpQykdIwcrFVfCc0kU
	NJSvPHHe0yBMHLV+qSpOcYAkTiFMjGshIjWuGHEEoZHj2LJ/0avQAYD9cmSejmwLivn7euNnW0fCv
	eidPTLhEiLTJuWtd5wXe5qOPHKaja0nm6h3XXpDjl3l7LpItHPSoazM3YExSShVNzKTMEE5YJr8xS
	Ryhn+jQ6Z6N12NIestUn0wdMqSbH4LlzCQTo6xX1yAKNXTK2EDa9MDrl4gPW3Pa2D6mHV6cStNTpv
	6t7xB5eM0y19tBjDslw8msugP/rny5qFQuF6NneIvcovfmFWVqGM38fNqJWZb1ECgOTyZMmOI18jV
	DcAYoI5A==;
Received: from localhost ([::1]:31998 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kG22r-004mrr-GH; Wed, 09 Sep 2020 15:30:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59964) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kG22l-004mri-SC
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 15:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Q6imWicjvSC8iRnUfl0na+ChV5VpbNkoPBEkONb0j0s=; b=BicEZnK9NlPNbMm99R39OWR5UG
 GIEo1Si7emJ27iwaXgNNQJ1qKKcrc5uh5sWZcAT/ULft8jjUmtdT9pszEKaGMiaiOBud/3Sr+slhn
 TaXppgRCqcf2hcoKO0MbHg9CgHeiwZirtwtdUkiUiuCtJrq4v5dalZywEbSF7jZKSq0tUqm4tqpCn
 6dkkrxnOm7RfibRwt3jFMMAxuLR5+aGucmw/ls9VKdrB/3G7/Jt4qRteqeT/QIYNuSC4ouJTa8odP
 xTPMpfVnifpxHKj03S/72S8oNyzZmKCFt8uT0WICcIgG7pRjIs6ET18Vzuvg8ziUt6TAGZKTlUtj8
 68tgKy6WrpdD41fB0CDtp/MKymNjVveSQyqxscWI1iq73gBN7jnZUImHf0c8WXZl9D+5GbuqMS9iX
 p2byC+CoBZtRUnw6VsbUMbvf7Emp5+NVQ/Qfe1bmtdbM/0hWlasonqb91qFMu24DLG4VlyC7Wja8a
 Bjl/fGVh8okc6H9mL/zSGADJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kG22k-0006FI-K8; Wed, 09 Sep 2020 15:29:54 +0000
Date: Wed, 9 Sep 2020 18:29:50 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC 2020 Samba Experience
Message-ID: <20200909152950.GC23377@pinega.vda.li>
References: <CAH72RCWUM8nqnOt=HeG1j4P-VEH4H+mF=2yo-yn3=uG6zxSx9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCWUM8nqnOt=HeG1j4P-VEH4H+mF=2yo-yn3=uG6zxSx9A@mail.gmail.com>
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
Cc: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 09 syys 2020, hezekiah maina via samba-technical wrote:
> Hello everyone,
> 
> I finally came to the end of Google Summer of Code 2020 program. I'm glad
> to have passed the program.
> I learned a lot of things which before the program I didn't have much
> knowledge about. I will outline some of those new things that I learned and
> give some feedback on areas I think could be improved to make Samba
> even better.
> One of the things that I learned in the program was using Samba Active
> Directory Domain Controller. I didn't know much about working with an AD
> DC. From having to set a server as an AD DC to having one that is
> functioning well was a great learning experience. Making mistakes is vital
> to learning how to work with something and I did a whole lot of them. DNS
> configuration and setting up Kerberos admin server was particularly hard
> for me but with time I have figured how to work with them. I'm glad to have
> had great mentors who led me through every step of the learning process.
> 
> Another thing I learned was to develop Cockpit plugins.Cockpit (
> https://cockpit-project.org/) gives linux server administrators a visual
> interface to interact with a server using a web browser. One of the most
> important features of Cockpit is that it provides an API for developing
> plugins to extend its capabilities. I was working on developing one of
> these plugins for samba-tool command line utility. Samba-tool helps
> administrators manage their Samba Active Directory Controller. So, which
> problem were we trying to solve? Using a command line tool is mostly prone
> to making spelling mistakes and a lot of repetitive typing to achieve some
> functionality. Having a visual interface reduces the mistakes users can
> make, improves the user's productivity and is a much more appealing way to
> onboard new users. You can find documentation about the plugin and how to
> install it for your operating system here:
> https://wiki.samba.org/index.php/GSOC_cockpit_samba_ad_dc.
> 
> I primarily used React and Javascript to develop the plugin. There are many
> other tools that are provided by the team at Cockpit for starting a new
> project including a starter kit with most of the files for the project
> already included. (https://github.com/cockpit-project/starter-kit)
> 
> Another Open Source tool that I learned to work with was Open Build Service
> (https://openbuildservice.org/). Through OBS I was able to write some
> config files which when pushed to build.opensuse.org builds packages for
> the different distributions and makes a package available for the end
> users. Leveraging the OBS, I was able to develop the plugin for users of
> Fedora 32, Debian 10 and Ubuntu 20.04 (
> https://build.opensuse.org/package/show/home:Hezekiah/samba-ad-dc)
> 
> One of the areas I found to be really hard was installing provisioning a
> Samba Active Directory Domain Controller. The Samba documentation for
> installing and working with an AD DC is pretty comprehensive but not really
> that straight forward for new users. Some of the concepts in the
> documentation require some prior knowledge of working in an AD DC
> environment and I think it is an area that could be improved to easily
> onboard new users coming to Samba. As outlined earlier some of these
> concepts include setting up Kerberos admin server and DNS configuration
> though the Samba documentation on troubleshooting DNS problems is truly
> priceless.
> 
> Another area that I also found to be really difficult was packaging for the
> various operating systems distributions. This might not be part of what
> Samba does but I hope it could be improved. There wasn't any comprehensive
> documentation I could find to help with the packaging of the plugin and had
> to depend on my mentors for guidance most of the time. Through trial and
> error I was able to understand how to package for the 3 linux distributions
> but I really hope this could be made easier for new developers.
> 
> Lastly I found the Samba codebase on GitLab really scarely :). Having the
> entire codebase in one repository is really hard to figure out which part
> does what. I'm not sure if it could be subdivided into various projects but
> if this is not possible a little bit of code commenting and maybe readmes
> could be used to help new developers understand how the various pieces fit
> together.
> 
> I'm really thankful to the entire Samba community for having me as part of
> the GSoC 2020 program. I'm particularly thankful to Alexander Bokovoy and
> Andrew Bartlet. They both were my mentors for the program and were glad to
> help me resolve problems I encountered along the way. I'm also thankful to
> members who used the plugin, discovered bugs and informed me and my mentors
> about them and to all those that answered and clarified my questions on
> samba-technical.
> 
> Samba has really been instrumental to my start of the journey of
> contributing to Open Source Software and will continue being part of this
> amazing community.
> I will continue contributing to the organization and improve the plugin. It
> has been a really good learning experience and will continue to learn more
> about Samba and the various OSS projects the community develops.
> 
> Thank you all and have a great day!

Thank you, Hezekiah!

It was a good experience in bridging two seemingly separate worlds
(contemporary Web development and 'legacy' enterprise software). I am
glad that you not only picked up the challenge but also really made an
impact with it. I am planning to package the plugin to Fedora in
upcoming weeks.

If you'd have time, please open bugs at bugs.samba.org for documentation
improvements as you see. It might take time but getting this addressed
is definitely important.



-- 
/ Alexander Bokovoy

