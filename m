Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B5E1DD9E4
	for <lists+samba-technical@lfdr.de>; Fri, 22 May 2020 00:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=M1cZwBw6kVmLTQi59X4di2XZUYIsDWL5kQUwFWbJBt4=; b=2Wk0/pxiT9ltQfkZ/aqZw9JBbR
	Ckyvak1AM5/cEe5UdQvkHxKqE1FLaAxF0/e5e/nufsgWBXCgekbm3/1kfQGJV19aediHx+QA6sRO5
	I1R1l2sKWXY0WWxPBUUor2aQ7Tt2fcsfg0N7hKfG1vVtRApJBbnTotjtLwPt99ioUepHVl+gOOITK
	13r4T4WbQVHqnqPtQOnyK0TgJpw8SVzs6A/de46qpiJrVZ657qiFe+TtkjmucvXXzRScO876/SX42
	pXVC0OJ75avreGWxYDSHileT5Cd3gMYZS+gL5pIup/9HbNv0+aEaDpDlrfGh9ShR+LmFRVHKsFeuj
	fQZIrz9Q==;
Received: from localhost ([::1]:50374 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbtLM-005Pc2-06; Thu, 21 May 2020 22:07:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46622) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbtLH-005Pbv-4F
 for samba-technical@lists.samba.org; Thu, 21 May 2020 22:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=M1cZwBw6kVmLTQi59X4di2XZUYIsDWL5kQUwFWbJBt4=; b=diqGW/pr6lxrqCTynlPzEeI0Re
 s2OK8i4HeMkc2+uM2X4ogKpGFXoeNGwRt9TVKCycQScZOibkmtFDlzzmVrVvsI4c4n99p+Iqp8cyx
 PJQxjDxIw7/sZVkeV5YNMihjKPCADH9LgzN1gAnsjvHPwKLSTbN8/keMjr70YFzr3uxTuys/fu/FX
 5fhS72Uo92nlMNZ7WqbMQtDhkZxQQnVAY0cyNXvd8C+1IsUQucJXTGIghegPdkheQmIIS33QFcx+X
 zzB2v8bGw7uuXQ+jxTlu8WkpCOggE6O2j2n2sA7xEm1tcqqBjEf8mJtm3AEf5I6durX8bHrQl/F9N
 ioHU+reyBCu+l3IQzL82JFi7JiEBaRPh3pUMR9QEsN7sXwbHk8L0A4DOpiR1SyaqC8l/PuDJq87FG
 4bqSO53bLh86Fv8utA1JkVwDD4q4e2Ep1F2BY5mpwCbJW/ny2gDZn0Cthk9RWmXABU737mzIOwxKG
 D+GA/oUUbvmJosVhwQbB/KVc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbtLF-0001CR-Kf; Thu, 21 May 2020 22:07:06 +0000
Message-ID: <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Christof Schmitt <cs@samba.org>, Jeremy Allison <jra@samba.org>
Date: Fri, 22 May 2020 10:07:00 +1200
In-Reply-To: <20200521214312.GA12586@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
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
Cc: swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-05-21 at 14:43 -0700, Christof Schmitt via samba-technical 
wrote:
> On Wed, May 20, 2020 at 07:19:59PM -0700, Jeremy Allison wrote:
> > 
> > That sounds like a sensible plan to me, but having said
> > that I'm not going to be the one doing the work :-).
> > 
> > As we as a community have decided tevent_req is "The Way"
> > then helping our older stacks integrate better with it
> > is certainly a good way to make progress IMHO (and I'm
> > as guilty as anyone as the author of the horrible hack inside smbd
> > to do async opens which sidesteps tevent_req in order
> > to reduce code changes).
> 
> So i am trying to understand where this leaves us. The driver behind
> Swen's patchset is to move away from libads with the end goal of
> being
> able to better control the domain controller selection.
> 
> Now there is tldap and ldb as possible ldap libraries. Do we need to
> look at the integration of those components first, before adding the
> ldap library usage in winbindd?

Yes.  I think so.  I know this sucks - being told to stop on a fairly
simple change because we should do a much larger thing, but I'm really
passionate to avoid having three full stacks. 

> The goal of having one ldap client stack is worthwhile. From what i
> can
> see, tldap implements the async tevent model, with the exception of
> the
> gensec part. Also the async calls are currently not used.
> 
> I have not looked in ldb much, on a quick look, it seems to use the
> openldap library again. Would it make sense to have ldb use tldap as
> backend and eventually move away from openldap?

While there is a historical OpenLDAP backend in LDB (a legacy from a
time when being a semi-independent project was critical, possibly still
used by sssd) Samba uses lib/ldb-samba/ldb_ildap.c for all ldap*://
URLs, which is based on libcli/ldap.  This one brings in the full suite
of GENSEC, Kerberos etc.

I'm not opposed to the concept that libcli/ldap and tldap are merged in
some way and see particular opportunity for tldap to use the LDB
structures (which would reduce further the code in ldb_ildap). 

For another approach, if the initial issues are around timing handling
in the OpenLDAP libs under libads, significant advantage could come
from rebasing libads on LDB.  libads is a sync API (and stuck at that
for now) so the LDB sync API would be a good match.  Doing so would
make things like our 'tls *' parameters work consistently for all our
outbound TLS connections, which would be a big win. 

I realise this is not what you were hoping, but perhaps we can find a
way forward here.

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




