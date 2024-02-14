Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 444AD8552A0
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 19:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=i+duxj2tdqBxf1tP0QSxBPSRHeGYraczhIkSeLyUFQs=; b=Qrx2vkd5W/AICq3xgsyIc80RKy
	syjBvL4NXdLQqhDKqzRYJGzGGTkBvsmm4GqVhFNdp10YZIN7/CNINKYBr6XUvrdMkbOvjHV+wy58g
	pwMT3GePWoIY15AB/7k6/6DrkHH8Cwc3jvQbccBCGbGV1QRxb+9j9xZz7S0t7nKTcti63Q+vqlwRn
	USv6BYP+vLJnIc7VS0n0lAVwLUr8pQgddbxNjxlMc360HdCgYMGoU1KUK1L7d2HQHssbArj4tIZV+
	KxefrI13ZOk5nIqu9oYmGSVYXMz9Y8N7Bk3LbQIj/vRGBuLctLDvvtCt64yMKExqOinceLefTNe+2
	Org2HBVg==;
Received: from ip6-localhost ([::1]:19362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raKJN-008Ttm-TT; Wed, 14 Feb 2024 18:48:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33110) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raKJJ-008Tte-FD
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 18:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=i+duxj2tdqBxf1tP0QSxBPSRHeGYraczhIkSeLyUFQs=; b=crd37QquQJSDAkaK45hQoOIWXC
 /LtrukCkEQOKmq8AIqmWWV4an469ZxeyxjAzu3Qq8sNQ25Io4g0L3sw0klovuLmp2griqQ2jUzw84
 vNs/HBXj/LxHP1OossrFwcm+qIcDGJEg38FtxxRtBq2AVuP8vHR95chXb+VwS1/1/ynKJ9QC++28C
 6iMLwGg7yS516jsEllrUYrNpjrIUsMkiMWqweThXFK2AMQFD0zTj0lxPvVKzfXqtHkklaJglhVzxY
 VmJGrOefg+L2KvWIKRfPqysyUo6exjtrkOlGWdvioTEDeE8SSOGMq4M0cyUfeP2KXn6PPdSMDpjKK
 pZraeTZtC/Zc+Sgk7Ttaz9QgOT65LC7fyxxyQ9SfwP+HLbohfkXse+qxdwpS7PB2vJhVMLVi4fGOQ
 Woj59fbnW8Pw5VCRuLLkHxBTIVJbHt05NGx6PitbwsPzWGsxd8qohy9tGZhdYDp+qpWt2u3d7eLCN
 0XHRNCBjjD1Z9sPeYF5IDpy1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raKJI-00D4a5-1F; Wed, 14 Feb 2024 18:48:44 +0000
Date: Wed, 14 Feb 2024 20:48:32 +0200
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: Looking to once again re-bundle LDB
Message-ID: <Zc0LAN08B3wPY8pr@toolbox>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
 <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
 <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru>
 <Zcz2oHdkRyYgJK6E@toolbox>
 <dc921798-03f9-4045-957a-dadedc51993f@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc921798-03f9-4045-957a-dadedc51993f@tls.msk.ru>
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
Cc: Andreas Schneider <asn@samba.org>,
 Michael Tokarev via samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Срд, 14 лют 2024, Michael Tokarev via samba-technical wrote:
> 14.02.2024 20:21, Alexander Bokovoy via samba-technical:
> > On Срд, 14 лют 2024, Michael Tokarev wrote:
> > > 14.02.2024 17:46, Alexander Bokovoy wrote:
> > > ..
> > > > We do rebuilds of the whole stack in Fedora if bots detect samba ABI had changed. So for us it is not a problem.
> > > 
> > > It's easy to do with "current" Fedora release.  It's entirely different
> > > question when you want to provide current samba to a previous Fedora
> > > release.  And that's where the problem is, - providing "backports" of
> > > current samba to previous releases of distributions.
> > 
> > If you are building packages on top of RHEL by replacing existing
> > packages there, you are responsible in fixing all breakage that new
> > packages would introduce. It is maintenance work that one needs to
> > consider when providing alternative builds, regardless of a
> > distribution.
> 
> Exactly.  Ditto for debian. Even debian backports, while being part of
> official debian and using debian infrastructure, needs additional work.
> It is good if a new version does not introduce incompatibilities, -
> this way it can be provided at less work to previous releases.
> 
> ..
> > > Yeah, it would be best to build samba against mit krb5, if it were a
> > > supported way.
> > 
> > It is supported. It just provides a bit different set of features
> > compared to Heimdal-enabled Samba builds. See our talk at SambaXP'23 for
> > details.
> 
> I know it works, and it's kind of supported, with --enable-experimental-mitkrb5-kdc
> or something.
> 
> The thing is: personally I don't have resources to support it by my own
> in debian. Everything I do there, I do at my "free from work" time, I
> don't know how all this AD-DC thing work.  After all, my only intention
> when I come here was to fix a bug in samba form which I suffered in my
> work (had to restore lots of user profiles lost due to samba data
> corruption), and am still there because it was not "just flip this
> one bit and it all works" thing :)  So I entirely rely on upstream
> samba for almost all support work.  And there, MIT-Krb5 AD-DC is
> "not supported".  Hence that's what I mean above :)

I think that statement of 'not supported' added more damage than helped.
I hope we can move forward from that by acknowledging there are
different use cases for Samba AD that involve configurations where one
or the other Kerberos implementation is better suited. For example, not
everyone needs read-only domain controllers in all environments. Or not
everyone even need to use Windows (shocking, right?) as domain members.
;)

There are still issues at how to present two separate builds in a
distribution but that's a different story, not an upstream problem. At
some point we have to bite a bullet and move forward.

-- 
/ Alexander Bokovoy

