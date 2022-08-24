Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A659F165
	for <lists+samba-technical@lfdr.de>; Wed, 24 Aug 2022 04:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4/l78FgVgawyjVjazRZLbQqXxV/CRg236XJSrIXRWC0=; b=zDdF7fjsSg+nu/9KlnYJXTM9YY
	9kqbt3FRVzOyf84arR0B+oKyjj9eOz74frVqY57sXcFKbO4ve7g1Iu3p3xU1qjyETjF6zeVAwBymn
	MItFUSIbNmZ5lpSsy7ygtJj8a3qu+j2rWXMj122puHMRfqDp45m1y+kIDf04Dl0+qwUY7xT0MTh7J
	mR0Zs/c/1ZBqsbw9YYaZqrm3iKILQtpRh38kYKvcy7l5qspsuwAfd5IOwH9smgLm49MZnFeBxc1on
	acpJN5KBFP9XR7o2hsHhuUbmezat6A75reyg/pFxGcpAhOsURMwfz5r5Z9k3wIBBRixFtKMbTbcR+
	KOq1q72w==;
Received: from ip6-localhost ([::1]:62736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQg55-0029PA-Gs; Wed, 24 Aug 2022 02:25:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14978) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oQg4m-0029Oc-Kk; Wed, 24 Aug 2022 02:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=4/l78FgVgawyjVjazRZLbQqXxV/CRg236XJSrIXRWC0=; b=GVfCtRUi4+UKrEQOjtoak/Sj/h
 zoX/lJJmkpnz2g8avq04SXooIIXTsI83TQOY3q5W9F92xwb9v1z+9P2aGKvyDYU+L2BnwTOJ/1AAf
 eRn0A4isajgOVOgS82+MMYbKgYipEZl5e29UWSfU0A5NL2kSDoIaGDyCNHvaeRclcczvSvEiRfZJ9
 O0E/FkUua3tHlmIQmDklRFJSt+JQ2C+OiIQdNtKgoFlrwCofSQJjgfRTg6Z/VgKOExcpgJdlNYqAa
 k1i0sL+OQqblSkEwaER24YyqNn041tDFYHv6qKYHRYI6f1gixSNtvV3+EFQ2e2nZhJNZB2lptUCnf
 yY7B5pU2CLPJ38UqLmTwng8nTLKcha4Oau/f3rJdK3tc29q7RzFUqinw/UrRiusSZT2qgw5pvfc6w
 W8foHJPqeQgFCcia5bnBXPOoXyA5iPwHjicrkWdNB/8Hqg49zqpY+xxtPr/dVmd8YWTSBdenpEqwt
 +gkSniFSU305AkaSrSP1dBJM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oQg4l-001UKY-9W; Wed, 24 Aug 2022 02:25:03 +0000
Date: Tue, 23 Aug 2022 19:24:58 -0700
To: Douglas Bagnall <dbagnall@samba.org>
Subject: Re: samba-tool error messages: what needs fixing most?
Message-ID: <YwWL+rx1yEUpbeIp@jeremy-acer>
References: <cfa3f458-f9ce-6671-5cc0-ab3b53103c9c@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cfa3f458-f9ce-6671-5cc0-ab3b53103c9c@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 24, 2022 at 01:22:55PM +1200, Douglas Bagnall via samba-technical wrote:
>hi,
>
>If you have used samba-tool, you will be aware that it often reports 
>simple problems with long messages talking about exceptions and line 
>numbers and file names and all-caps error codes. Sometimes, well, 
>usually, these messages turn out to mean something like "bad username 
>or password" or "samba.example.com is not a real address".
>
>Every so often (but less often than you'd expect) somebody has the 
>genius idea that samba-tool could just describe the underlying issue, 
>and refrain from the detailed account of subsequent woe. Even Samba 
>Developers have that idea, sometimes, but then they look and think 
>"no, too hard" and get back to debugging clustered inter-forest 
>symlink tevent races with S4U2SELF SPOOLSS ntlmssp_states (or winbind 
>for the extremophiles). But NOW I, fully sober, have decided to 
>*actually* try. Which leads to the question in the subject: which 
>messages need fixing?
>
>So *please* reply to this message with a samba-tool line that says 
>something really stupid, and suggest a better message.
>
>It won't be possible to fix every example, and I will try to be 
>cautious. It is worse to hide real problems than to expose everyone to 
>horrible noise.
>
>
>Q: But won't this break the Application Search-engine Interface (ASI)? 
>How will we be able to find old posts on stac^H^H^H^H 
>https://lists.samba.org that quote the old nonsensical message?
>
>A: Yes. ASI stability is never guaranteed. But you can always get the 
>old traceback by appending -d3 to your samba-tool line.
>
>Q: But I like things the way they are. It makes me look like that guy 
>in the Matrix.
>
>A: You don't want to look like that guy. Also, try -d10.
>
>Q: When?
>
>A: 4.18, and don't expect too much.

Woo hoo ! Douglas !!! Thanks so much for taking
this on ! This would be a wonderful improvement
for our usability.

