Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57CB5917
	for <lists+samba-technical@lfdr.de>; Wed, 18 Sep 2019 02:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=BRN1L8K53ZvXmklrULzSQ28DF+f37q1zNhd1Beqsp0g=; b=RQ04Ldfdx4Ssf0oWWVroM0YY7O
	2bu3HVKVmWSZYMDhxblueY9FNgGbRSdAL0FTrPuuEfoC7O6kR0uyFE1IMKRL/bauKi6lx1h1RZ1UT
	r6yQHQBLmFt2AGfgCCSmQgvCBJxAeXNYdzRg0IF0zqiDSz/ezD6quC+un024QlRDR19W7/8OJJc+p
	+N8h1CD4k8upl1DVdo3D4h5ub0VcFnmmEROWPfPWMb1F1pg3rYfezwswQktChmBHHn44szBYIoKcE
	AqEDehaai6mgoANcCd0rfO+7Kl/GGnoEumB5+4hU7niRfTGtXqXYmefJD35lq4yQmn9qHfCvN7nIA
	77ulh7xg==;
Received: from localhost ([::1]:31134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAOBB-006MN2-0g; Wed, 18 Sep 2019 00:50:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63418) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAOB7-006MMr-Gm
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 00:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=BRN1L8K53ZvXmklrULzSQ28DF+f37q1zNhd1Beqsp0g=; b=pYPh8+tCd4i3gTpTI59OG4JfNB
 y7hHpHRcN1o9q+0oXQrtPznrPnEAaUPGrGyobKRTIhriKCRZoxjP/oh/O3YqGbCyFe2H7q8Bvat5F
 NG/4nl8YBkJA1w64ppRLLUhMG83JNTJcrCmEFK2/ELt0QvftEdXUlztqhjnaHLHKIsew=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAOB6-0004Sf-0d; Wed, 18 Sep 2019 00:50:40 +0000
Message-ID: <1568767835.4377.53.camel@samba.org>
Subject: Re: samba performance difference between old and the latest ?
To: Namjae Jeon <namjae.jeon@samsung.com>
Date: Wed, 18 Sep 2019 12:50:35 +1200
In-Reply-To: <001c01d56db8$a5ec1420$f1c43c60$@samsung.com>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com>
 <371f328678d7f01b7051d657499ec0f8b341b2f9.camel@samba.org>
 <CAKYAXd80cwJ2XUOBoP25M94mB_P200Y7BnajsSZwWkMuuXO8Yg@mail.gmail.com>
 <b34d077e33bcb6e72a25e6cd0b32ed28e570c7e0.camel@samba.org>
 <001c01d56db8$a5ec1420$f1c43c60$@samsung.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
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
Cc: sergey.senozhatsky@gmail.com, 'Namjae Jeon' <linkinjeon@gmail.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks so much for getting back to us.  Make sure to catch up with the
Samba Team at SDC to pin this down further. 

Finally, to ensure I understand your reply correctly:  Is it correct
that 4.8.12 is 'normal', but 4.9.13 is 'slow'?

Thanks!

Andrew Bartlett

On Wed, 2019-09-18 at 09:33 +0900, Namjae Jeon via samba-technical
wrote:
> Hi Andrew,
> 
> I'm sorry I'm late. I forgot because there are many issues this week. 
> I just checked that the performance is degraded from samba 4.8.12. 
> The version I checked is as follows.
> 
> 4.7.12
> 4.8.12 <--- performance degration
> 4.9.13
> 4.10.6
> 4.11.0
> 
> I can look at samba changes more, but I am sorry that I couldn't help
> you much because of the event(SDC 2019) next week:)
> 
> Thanks!
> 
> > -----Original Message-----
> > From: Andrew Bartlett [mailto:abartlet@samba.org]
> > Sent: Wednesday, September 18, 2019 4:33 AM
> > To: Namjae Jeon
> > Cc: Namjae Jeon; sergey.senozhatsky@gmail.com; samba-
> > technical@lists.samba.org
> > Subject: Re: samba performance difference between old and the latest ?
> > 
> > On Sat, 2019-09-07 at 14:58 +0900, Namjae Jeon via samba-technical
> > wrote:
> > > 2019-09-07 12:20 GMT+09:00, Andrew Bartlett via samba-technical
> > > <samba-technical@lists.samba.org>:
> > > > On Fri, 2019-09-06 at 11:01 +0900, Namjae Jeon via samba-technical
> > > > wrote:
> > > > > Hello,
> > > > > 
> > > > > I found something strange during measuring performance with samba
> > > > > these days.
> > > > > I checked the performance of samba 4.7.6 and 4.10.6.
> > > > 
> > > > 
> > > > > samba 4.7.6 : 11.6MB/s
> > > > > samba 4.10.6 : 9.5MB/s
> > > > > 
> > > > 
> > > > Jumping back to the top of this thread to focus on what you could
> > > > help
> > > > us with.  If you built Samba for both of these tests, then perhaps
> > > > you
> > > > could do a git bisect between those two versions to work out where
> > > > this
> > > > degraded?
> > > 
> > > Yes, I agree to narrow it down.
> > > > 
> > > > Of course, this assumes it was a single commit, but who knows, it
> > > > just
> > > > might be.
> > > > 
> > > > Either way, if you were able to additionally test 4.7.latest,
> > > > 4.8.latest, 4.9.latest, 4.11.0rc3 and master (so as to add to the
> > > > dataset) it would be a massive help.
> > > 
> > > Hm, okay, I will make time.
> > 
> > G'Day Namjae,
> > 
> > I just wondered if you had any more numbers to share with us?
> > 
> > I know I asked for a lot of work, but we would really appreciate any
> > insights you have on this.
> > 
> > Thanks!
> > 
> > Andrew Bartlett
> > --
> > Andrew Bartlett                       https://samba.org/~abartlet/
> > Authentication Developer, Samba Team  https://samba.org
> > Samba Developer, Catalyst IT
> > https://catalyst.net.nz/services/samba
> > 
> > 
> 
> 
> 
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





