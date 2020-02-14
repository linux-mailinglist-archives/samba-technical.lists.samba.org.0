Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6471F15D3A0
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 09:14:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ehyRSjxTfdWY5szpQjnhi23YhhHqS9PR/yLC9U70tgM=; b=6TpVJqMPPu4Yzv0B/98k6WEnrU
	77XFegQzfMgdBxRQs/3pfzaqJkJLjIMKfq1znkR40dyuI4+C8xrFyS6mmwK1/1rVQs8doWsWR3cLk
	ea+9Y5T+zwsqnoOprWWk2zb1yJ0KJDWQk12xq3f3Lk5GapaUEns3p7dO4jp929gshQM1Ka4lvq4r1
	dE2pEJtJPhtwsTkidRg2D8uz10SuJxkAJUmHjPi0HSVN0omexCyfJKaGgm1N7RqQOlpw9G6DHPcmG
	q8vyYh7H65M+bEMf/SgFhquSu2fqFFObgKIn9wRVByXmFhpeEylFFiBGkknrGOSgxAmJ7HdEiWMTq
	xgk5qEQw==;
Received: from localhost ([::1]:49910 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2W7I-009q9y-PJ; Fri, 14 Feb 2020 08:14:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46568) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2W7E-009q9Y-37
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 08:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ehyRSjxTfdWY5szpQjnhi23YhhHqS9PR/yLC9U70tgM=; b=scNk6feYUEOg+UCsO9HBNk502l
 jqa1GqTfw9f/rMEwBG26UGcbQwdYCD3/3/frLgcggDRXIXQQ3Xy7AvMnop/7I98pDMXe2CIb7BDzu
 ikbimLFjZ9/OR99r0qfCkFdDZVnUONT83UAthdNXizSN3ib6KzNNZzz9FjDNiriozSLmRd0WEZXwk
 gTsXeX6Zlw/SETxNVTbakabQTII4IbxR7+9wKupdjWU0gJrTqwnnqoupjtg1f3pGwe66OPUY3nhJT
 0rpm7KUtKUYH9NpDhZEqvMciplP+WugYN6Qwsg8TLoRTFkeXfalV1AqGcMxPAIcH8Gwl5U9OPKdlf
 M7PbX5zd+rHqrjb44wxuUgPHr5o1ODTjxY+57Jvo9oRdJgh74v7PpeCBvAR/GsGNzx62d6jJxIPDy
 p/QIQkT7PsZvctepjBJ0yPEwL5nS4OF4QZfcq7K+k8I5cVlt17uJJXc1NPig5dHRjqpW5b0rFzSWH
 CS9IRkIHz+HJFJu17oC7+f71;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2W7D-0006aJ-6w; Fri, 14 Feb 2020 08:14:23 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: GitLab CI back
Date: Fri, 14 Feb 2020 09:14:22 +0100
Message-ID: <12664955.9vtTuTgCUs@magrathea>
In-Reply-To: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
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
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 14 February 2020 06:01:16 CET Andrew Bartlett via samba-technical 
wrote:
> G'Day,
> 
> A big thank you to everyone for their patience, the GitLab CI private
> runners are back now.
> 
> There are still things I would like to do:
>  - ensure the alternate configuration for really old Samba versions
> still works (I think that image ID also changed)
>  - decouple the system from the catalyst_samba key and use an ephemeral
> key instead
>  - provide a top-to-bottom script that pulls a docker image, installs
> the required software and runs ansible that only needs the credentials
> as input
> 
> But for now, it is back, and the bastian host is now running a 2020 set
> of updates, which is a good thing regardless.
> 
> Let me know if you have any further problems, otherwise please just
> restart the failed jobs.
> 
> Finally, I would plea that some other interested team members learn how
> all this works, so as to avoid having a single point of failure in
> myself.
> 
> Thanks!

Thank you very much Andrew!!!

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



