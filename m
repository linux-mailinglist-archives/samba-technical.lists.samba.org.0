Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E041F465F
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 20:35:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Zl+I7oFNn3j2p7o0M0q1D06H5SNU935V6Cmyy4mFO98=; b=d11cuUolbmaEqT6iJSybJ9nmX+
	mcem5Vjosbq0RwfYGhEIlcDQjrNFjCO/0VZBNyXLhg0yHsaro2LH6MN+CvWq9e+8vZjaMQs7xBbNA
	/aX6zq0NgGlTmnv2Afpoypu1/uExYfjaXdP8gMoVRVxrdlgY00WiocNcvj2zwrWdgdyCpTQRCDYxi
	3a2dWjID4nsxYFWYuIojF5K8wcp0yQIhKnia1nBF4aF9RfcQLs5PREzkp/rc8THyEXwHWTwFNLDyp
	zUZUdaYhYgEnt6XgxyXhjpgi3wod3DdV8O+gnWxP16qIWI21OCLROPWjIJsUv/j7iiVwDRWoAMDIL
	TXCb1Adw==;
Received: from localhost ([::1]:53332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jij5c-009dyE-3z; Tue, 09 Jun 2020 18:35:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15106) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jij5W-009dy7-CT
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 18:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Zl+I7oFNn3j2p7o0M0q1D06H5SNU935V6Cmyy4mFO98=; b=NQuAzIyKALxn3yFWEhThC4+lEG
 1yPzV9X/saUjKJB4LItk7HElG4sFIlfNckJxqGZ8F1mfTukEayTQn/6GT4O+EDwYtKSVta3j5dU37
 5VFfk1KmI9jeRMp9GKnHVtHLtrZxZyreDFQbqneUDDhyRtNE6S84GBihX+nPHZWYMHnVmazyOlcsX
 KkP0hpeU9QsZwKwfp5/4wWFiUSOxH+G0AvIh1QFORfooqpsUR0pymyMCeoKdistqyLUim5L7jBakd
 6vnr2t85oJa89ELN5W6tLSWU9Gz1qqJY9grN//wMv/WdSvyDsCmWo+PnSeQxQFxhQwuH3LN9FexWy
 D+DE0QrFNLrL66TwJ4k4u6ak+hZCiIKY4oahMMFDcnTeIvi5f5+9FNNLSVAQpcxe+sD7hqOn+liZN
 2eOMhEuzJU2oGJUnyuiRIuGh8t3z7lZj7DzqbMDqQKnEBfRf55yJIzG645h4pwRM/Rgsy/xkmT8cv
 3/1MaNuVaYr7PPfOVE4OFfMA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jij5U-0006Fq-VJ; Tue, 09 Jun 2020 18:35:05 +0000
Message-ID: <573f3e2b88f8051073ada03ecb2658d8f1a8a58d.camel@samba.org>
Subject: Re: Merge Request Template for Gitlab
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Wed, 10 Jun 2020 06:35:01 +1200
In-Reply-To: <3443591.AXIHuhjjAK@magrathea>
References: <3443591.AXIHuhjjAK@magrathea>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-06-09 at 19:19 +0200, Andreas Schneider via samba-
technical wrote:
> Hi,
> 
> as I don't have any rights on gitlab repositories, could someone
> please setup 
> the following Merge Request Template:

Thanks for suggesting this.  I've made that change so others can give
feedback based on how this works in the real world.

The only change I've made is to reference README.Coding not
CONTRIBUTION.md.

I've got some of my own comments below, and if we come up with a better
text I'll update it:

> ====== template ======
> Add a description of the new feature/bug fix. Reference any relevant
> bugs.
> 
> ## Checklist
>  * [ ] Commits have `Signed-off-by:` with name/author being identical
> to the 
> commit author

We should find a succinct way to reference clearly what this means
(and/or revise our policies so it is possible to understand simply!)

>  * [ ] Code modified for feature

I'm not sure exactly what you mean by this checkbox.

>  * [ ] Test suite updated with functionality tests
>  * [ ] Test suite updated with negative tests
>  * [ ] Documentation updated
>  * [ ] CI timeout is 3h or higher (see Settings/CICD/General
> pipelines/
> Timeout)

This is not needed for the shared development repo, but saying so in a
succinct way will be a challenge.

Some wording pointing at the Contributing page on the wiki might be a
good idea also.

> ## Reviewer's checklist:
>  * [ ] Any issues marked for closing are addressed
>  * [ ] There is a test suite reasonably covering new functionality
> or 
> modifications
>  * [ ] Function naming, parameters, return values, types, etc., are
> consistent 
> and according to `CONTRIBUTION.md`
>  * [ ] This feature/change has adequate documentation added
>  * [ ] No obvious mistakes in the code
> ====== /template ======
> 
> 
> Settings -> General -> Merge Requests -> Default description template
> for 
> merge requests

Finally, we should just be aware that this feature is not in GitLab CE,
so we would loose it (just as we would loose the Approve button) if we
moved off gitlab.com.

(That said, it is entirely possible GitLab will open source it if we
ask, so we should do that)

Thank you *so* much for proposing this.

Everyone else:

Please have a go with the templates over the next few days and help us
get one that helps us all!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




