Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8B1F3754
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 11:54:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=jTde81guGcBArdTPHNGaaHWTUvF5AGh/ZGssJa3oEcE=; b=IrWy6H6PtItRoWpYMqRFl2s1t4
	zlBSWc08X/O+jF3ajN7UmEfEPrCOSMYydWfcBGPNQTLh26SQToezqsa8G2gyq48O9+bvMrDWU3MVK
	SSARCGhGpCc3MCvryY3Rr151vymaTl90XRK1e9L6csjDLuLJeBuEfdSjEgwaKh7VpRTB6gXvvdY3x
	nYF0iVp2V+LtI51PYhMVKYGB12x0HJ90J+aiVI/0dGrEwKBoiDwwE1zNwI7duA6W2xzJO7AQ0B+eS
	bEq157KO+JxLr8d/rLWqJgUMuAltOvWlhDV/na/8quIWgeBwohjxb5vX9b/sLBdtzEbDW1MUgkUa5
	mBPFHkAA==;
Received: from localhost ([::1]:35234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jiax2-009av0-Bw; Tue, 09 Jun 2020 09:53:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25330) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiawv-009aut-0X
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 09:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=jTde81guGcBArdTPHNGaaHWTUvF5AGh/ZGssJa3oEcE=; b=YKMvwfz8HhijGf4YHiCzDUBDfn
 Nmd/Tpaokzw09rpfeE8e7yH9To/pY7PD7FGUROTjO0UJQi2ulnl5wgk5WyJmsvun7I54wExtliTRd
 YTa0rH5P5ZwKuM59c6X9P9/wFvX68mpMZoxZePtAMZBOLrz02/Mks2kPdWh90eHd//Kmvvb5K1/Dm
 4o+XE/P605jb9LHmr4qMhCaqgafOO7YODeuP689U2OOmzixVD9sRqCXGWFcNmlYhdu7sCmcGfD7ny
 KtuJFt+pjXsQ6WHy06XJi6iOWPyFlbx9fX4NboEHfh/b9LHJ3UdlD+T4Di1zSzjtXKnr5RiYWProd
 HTIyhUIPRwIW4pWL+mS5mlvKzCHqMqXUXUPD2yqLedAm0TnDWcTK86Reok0QBup5ng8Q32amBSFAa
 ckUJNuoF/I+GTaS5ViJO4BiqSS8zhXHa/5MPATNZO48DtW2tpxWfqzEbeWxhWegBayrhWe1TbhrXl
 HoQtYgPf4SLJDVQ2JIwYem1V;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiawr-0001R5-TS; Tue, 09 Jun 2020 09:53:38 +0000
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Andrew Bartlett <abartlet@samba.org>, Karolin Seeger <kseeger@samba.org>, 
 samba-technical@lists.samba.org
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
 <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
 <20200608231733.GA839@samba.org>
 <6caef0c2-7b6f-4665-8ae4-6ba9c2f565da@samba.org>
 <2096111bb99eef34a4dccb059ed6eac23ac4ef87.camel@samba.org>
Message-ID: <6ec67eb9-96ab-3eac-faba-b50bff8656a8@samba.org>
Date: Tue, 9 Jun 2020 11:53:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2096111bb99eef34a4dccb059ed6eac23ac4ef87.camel@samba.org>
Content-Type: text/plain; charset=utf-8
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 6/9/20 um 11:15 AM schrieb Andrew Bartlett via samba-technical:
> I'm sorry, I still hold to my disagreement. 
> 
> It is really important to understand that while this will fix bugs, I
> don't see this as a bug fix.  This is a lift-and-shift.  These
> operations are both delicate and risky.  They also often fix bugs and
> introduce important new features.
> 
> But this change needs to be evaluated at that, fully aware of the
> implications, not just passed in as a bug fix.
> 
> I've been involved in implementing and in particular reviewing a large
> number of lift-and-shift operations in Samba.  Rarely are they as
> simple as they appear, and this one has the added complexity in what
> I've raised about the target.
> 
> Therefore this cannot be simple regarded as a 'bug fix'.  I'm very
> sorry.
> 
> Furthermore I've been told that this is actually the culmination of a
> significant amount of work over a period of months or even a year.  I'm
> incredibly sad that this work got to this late stage before public
> discussions allowed these issues became apparent.  
> 
> That is awful for everyone, and for that I'm sorry.

I'm sorry, but to me this looks like the better is the enemy of the
good. Replacing libads with the existing and already used tldap library
is a step in the right direction.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

