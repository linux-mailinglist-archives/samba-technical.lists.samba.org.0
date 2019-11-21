Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80236105D19
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 00:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+JqTZymDJV9U31VHWODYV0xco0uldz6QzYufe1OmiMc=; b=b0ySX8m13jGoM/C1SteUiT2j28
	GRpJWsqMVueFV7Bl1w7k8kzjq1TZZ3Kg8Vsldiyb/ZvIgwuO9Ts3D7aOAgBnShn2nLoag1irU0JQM
	wk3piK/W2+TwE8jdOrvyyWbv1JobQXdz8IoPvvsLFJKXm7RviVSYdfLP3CXaPUyKP1Jhfcd1JV8jS
	IX/ZS1AO0EltrKLtFhViRCwZ40IzM86c4tQyZnzuQe9BaA9djRDI17jm44FcSmy1biGLMxd7cJURZ
	vkMXnBMab6FNS+0wqLERwgmt8Kh/mmVRNNKMX0qEz+/mglx+zUuMdCnhL2xqldEE8zf9aOhNlUS2s
	sHwkCMzg==;
Received: from localhost ([::1]:45896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXvh2-001z4L-D9; Thu, 21 Nov 2019 23:16:56 +0000
Received: from anteater.elm.relay.mailchannels.net ([23.83.212.3]:30327) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iXvgx-001z4C-0W
 for samba-technical@lists.samba.org; Thu, 21 Nov 2019 23:16:54 +0000
X-Sender-Id: dreamhost|x-authsender|nico@cryptonector.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id C01A9E0FEB;
 Thu, 21 Nov 2019 22:39:22 +0000 (UTC)
Received: from pdx1-sub0-mail-a70.g.dreamhost.com
 (100-96-92-164.trex.outbound.svc.cluster.local [100.96.92.164])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 01645E0E52;
 Thu, 21 Nov 2019 22:39:21 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|nico@cryptonector.com
Received: from pdx1-sub0-mail-a70.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162]) (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
 by 0.0.0.0:2500 (trex/5.18.5); Thu, 21 Nov 2019 22:39:22 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|nico@cryptonector.com
X-MailChannels-Auth-Id: dreamhost
X-Broad-Decisive: 407ad6495d511f67_1574375962583_2397112492
X-MC-Loop-Signature: 1574375962583:3236055638
X-MC-Ingress-Time: 1574375962582
Received: from pdx1-sub0-mail-a70.g.dreamhost.com (localhost [127.0.0.1])
 by pdx1-sub0-mail-a70.g.dreamhost.com (Postfix) with ESMTP id AA0B5AACEF;
 Thu, 21 Nov 2019 14:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cryptonector.com; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=cryptonector.com; bh=mF5AQPTIFF1rtI
 p2Cd5T2IYWnek=; b=I4+GC6S1LGzubA+WC99eI2SIzQ7gf8IyBxZy3zrhEFWylf
 m985RLtA6+OAUfeNOEJ3n8St/5emjkeMUoZQ1ENaP3/j2Ze89f9Lbr9UIj2ppq9V
 cuw/AkjEqHpunWSxgqaq0d9JOCUNGq49Ic0qfjWiDec6/85EbjJlznyKt+9a4=
Received: from localhost (sdzac10-108-1-nat.nje.twosigma.com [8.2.105.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: nico@cryptonector.com)
 by pdx1-sub0-mail-a70.g.dreamhost.com (Postfix) with ESMTPSA id 35CFDAACEC;
 Thu, 21 Nov 2019 14:39:12 -0800 (PST)
Date: Thu, 21 Nov 2019 16:39:09 -0600
X-DH-BACKEND: pdx1-sub0-mail-a70
To: Stefan Metzmacher <metze=40samba.org@dmarc.ietf.org>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
Message-ID: <20191121223908.GC26241@localhost>
References: <33c431f5-c36b-c321-de3f-65977d8aa898@samba.org>
 <007c29e8-02b9-4f48-f67e-881cb0985d64@mit.edu>
 <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: Nico Williams via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Williams <nico@cryptonector.com>
Cc: kitten@ietf.org, Viktor Dukhovni <viktor1dane@dukhovni.org>,
 "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>,
 Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 24, 2019 at 02:05:05AM +0200, Stefan Metzmacher wrote:
> resuming this old thread...
> https://lists.samba.org/archive/samba-technical/2017-August/122422.html
> 
> >> Does the Kerberos library know whether whether the application is going
> >> to look at PACs and SIDs or just use the client principal name?  I am
> >> guessing it does not.  Thus in Samba, one might need a dedicated
> >> krb5.conf configuration file that disables the transit check.  Other
> >> applications should still apply transit check even if a PAC happens
> >> to be present, as AFAIK it may well remain unused.
> > 
> > My idea was that Samba would use
> > gss_set_cred_option(GSS_KRB5_CRED_NO_TRANSIT_CHECK_X) to indicate
> > the the transited list should not be checked.
> 
> I implemented GSS_KRB5_CRED_NO_TRANSIT_CHECK_X for
> MIT, Heimdal (both upstream and Samba) and make use of
> it in Samba.

Hi,

The right design for this is to use name attributes, not credential
options.  Credential options should be banished altogether.

To see why consider an acceptor application that wishes to examine the
transit path (or whatever other attribute) an authenticated initiator
principal took to reach the acceptor.  What credential should the
acceptor inspect?  There is none to inspect, not for the initiator (not
even if they delegated a credential, since that one might not have
transited any realms).  The only way to inspect the transit path taken
by the initiator is to inspect its name, as that's all we have for it.
This is one reason we added name attributes.

Correspondingly and symmetrically, the right way to request some
behavior on the side where the credential is available, is to associate
that request with the desired_name for which the credential is acquired.

Credential options are not standardized, but name attributes are.
Please use those.

Consider this my code review for the Heimdal PR.

I understand that this is probably a big change, and that this request
may seem hostile (email being such a dry medium).  I'm willing to help
you make this change, both for Heimdal and MIT -- I'll help with the
code, and I'd be happy to have a conference call or exchange further
emails.

Nico
-- 

