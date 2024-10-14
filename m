Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BAC99D8E9
	for <lists+samba-technical@lfdr.de>; Mon, 14 Oct 2024 23:19:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=cbkjhDaSMDItSylwOR9RIjivsNCXwCALaMQN2awy34k=; b=r+zg3wrvdueln9nAyJhGkYiWZv
	PUVrwo/w5zcvwn/DZdyLhDaGpehm6/fKiRRnOhPmOQ2dWX3HVoFYVhLp8s12KGXXFRZA9tS0do6Pf
	LF3J8Hn41bpDkTWtFer/Go6OThD6xV89QwB4MMA8CRm7B8P+QaFnP84TZjBTx/F1D15dd8Hoj10Z2
	7LnicpxY1bt/jrQNFHTk236Km8EjTHyv60imX8MUWuBl9msCCUpZz2Ae8CQdxRFkuAoqxn1/uVvzs
	w9OVKfRAm5LqQKhioBHSSiDQs22puYdAHP00dEerlHQZq+RowRMQzwFKoYUuJTNqfFgeCscl7Nqn7
	i9PSoePg==;
Received: from ip6-localhost ([::1]:40794 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t0SSu-003z8Q-9T; Mon, 14 Oct 2024 21:18:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31398) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0SSp-003z8J-Cf
 for samba-technical@lists.samba.org; Mon, 14 Oct 2024 21:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=MM+OFc9yOoUI7uD/6p3ImDcSY+9wCCi7OGMmTwguvtk=; b=Vzk9qGPVmkpJzDmPeBBdPjCh5u
 1azkKJtPHI8EVsPIWGg7j3IQjCEkHPURCLHuvdEtX2peHxdXDAo1Jpd3EURqyXfp0/T+sRRsZA4yk
 7cGVaJSItDqRjTUVD3omWG1Ehs+0zYWJcub1USlhbgRmmkcT1AuKD8fvbWuqJeIL0FPp+mV3l8eG1
 dSOQ4asJVb0TX8JUQdA068Y8eA6j79lVm/qLi9ZD/OSMbq0QqKVQ8EafgjLa6p6tYODsLf3n6fuaI
 ELCApWgsHdENZD6FLMlUoH/OSwwGd+/rs9znYzEW8cevUrM03skSI78CJQCru7l89KT8WPP4b1m/T
 kIqaasLDID2u6zDBf7K0pf8DPSHCD/GqOeR1TAbMpCcxCM5UDa7tTO/4NnvLukh0nOrTK2wGHaj4U
 bTaj/DzYycFNZ8MzFnwGrkRoAjspc0pOPWarI71D44IEAszrs8munEe4qLMwftpYU0Yw3JgYixZDO
 XbQ2efWaRZxs+psLJZK0Fh9x;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0SSn-004p7r-25; Mon, 14 Oct 2024 21:18:50 +0000
Message-ID: <e6d8889be70994a7e0a41b1fef1db579729d9670.camel@samba.org>
Subject: Re: authentication policies in Samba 4.21
To: Jennifer Sutton <jsutton@samba.org>, samba-technical@lists.samba.org
Date: Tue, 15 Oct 2024 10:18:44 +1300
In-Reply-To: <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Sat, 2024-10-12 at 13:53 +1300, Jennifer Sutton via samba-technical
wrote:
> On 12/10/24 6:49 am, Stefan Kania via samba-technical wrote:
> > Hi Douglas,
> > Am 11.10.24 um 03:36 schrieb Douglas Bagnall:
> > > On 11/10/24 10:21, Douglas Bagnall via samba-technical wrote:
> > > > hi Stefan,
> > > > On 11/10/24 05:11, Stefan Kania via samba-technical wrote:
> > > > > I'm just testing how it's going on with the auth-policies in
> > > > > 4.21 and I see now it's possible to set conditions with:user-
> > > > > allowed-to-authenticate-to...
> > > > > When I set a condition I see:"msDS-
> > > > > ComputerAllowedToAuthenticateTo":
> > > > > "O:SYG:SYD:(XA;OICI;CR;;;WD;
> > > > > (@USER.ad://ext/AuthenticationSilo == \"win11-computer\"))",I 
> > > > > can allow the users from the silo to authenticateBut in the
> > > > > Windows-world it's possible to disallow the authentication,
> > > > > then it looks like this:"msDS-
> > > > > ComputerAllowedToAuthenticateTo":
> > > > > "O:SYG:SYD:(XA;OICI;CR;;;WD;
> > > > > (@USER.ad://ext/AuthenticationSilo != \"win11-computer\"))",
> > > > > 
> > > > > Am I missing something or is it not yet possible?
> > > 
> > > OK, now I see that maybe we are talking about different things.
> > > When you say "possible", you mean "possible using samba-tool or
> > > something".
> > Yes, exactly :-)
> > > I was thinking more along the lines of "will it work if it gets
> > > in this state?".
> > > In that case, I think you are looking for something like this:
> > >      samba-tool domain auth policy modify  \             --name
> > > foo  \            --user-allowed-to-authenticate-
> > > to="O:SYG:SYD:..."
> > > The other way is a shortcut to allow the most common thing.
> > That's what is missing. What is needed is another option to:
> > samba-tool domain  auth policy computer-allowed-to-authenticate-to
> > set --by-silo=win11-computer --name=win11
> > Something like --deny and --allow. That's by the way how it is done
> > on a Windows-System.
> > Take a look at this howto:
> > https://thesleepyadmins.com/2024/07/16/active-directory-authentication-policies-and-authentication-policy-silos/
> > 
> > You will find a picture (nearly at the end) named "Create control
> > conditions" This picture is showing that you can choose between
> > allow or deny.
> > I try to set the XD or != via a ldif-file:----------------dn:
> > CN=win11,CN=AuthN Policies,CN=AuthN Policy
> > Configuration,CN=Services,CN=Configuration,DC=example,DC=netchanget
> > ype: modifyreplace: msDS-ComputerAllowedToAuthenticateTomsDS-
> > ComputerAllowedToAuthenticateTo:
> > "O:SYG:SYD:(XD;OICI;CR;;;WD;(@USER.ad://ext/AuthenticationSilo ==
> > \"win11-computer\"))",----------------
> > But when I try to view the policy I get:--------------
> > --root@dc01:~# samba-tool domain  auth policy view --name
> > win11ERROR(runtime): uncaught exception - (11, 'Buffer Size Error')
> >   File "/usr/lib/python3/dist-
> > packages/sernet/samba/netcmd/__init__.py", line 353, in _run    
> > return self.run(*args, **kwargs)           
> > ^^^^^^^^^^^^^^^^^^^^^^^^^   File "/usr/lib/python3/dist-
> > packages/sernet/samba/netcmd/domain/auth/policy/policy.py", line
> > 163, in run     policy = AuthenticationPolicy.get(ldb, cn=name)
> >              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   File
> > "/usr/lib/python3/dist-
> > packages/sernet/samba/domain/models/model.py", line 286, in get    
> > return cls.query(samdb, **kwargs).get()           
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   File "/usr/lib/python3/dist-
> > packages/sernet/samba/domain/models/query.py", line 87, in get    
> > return self._from_message(self.result[0])           
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   File "/usr/lib/python3/dist-
> > packages/sernet/samba/domain/models/query.py", line 65, in
> > _from_message     return model._from_message(self.samdb, message)
> >            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   File
> > "/usr/lib/python3/dist-
> > packages/sernet/samba/domain/models/model.py", line 148, in
> > _from_message     obj._apply(samdb, message)   File
> > "/usr/lib/python3/dist-
> > packages/sernet/samba/domain/models/model.py", line 162, in _apply
> >     setattr(self, attr, field.from_db_value(samdb,
> > message[field.name]))                        
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   File
> > "/usr/lib/python3/dist-
> > packages/sernet/samba/domain/models/fields.py", line 402, in
> > from_db_value     return ndr_unpack(security.descriptor, value[0])
> >            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   File
> > "/usr/lib/python3/dist-packages/sernet/samba/ndr.py", line 48, in
> > ndr_unpack     ndr_unpack(data, allow_remaining=allow_remaining)---
> > -------------And here again it the working condition from a
> > Windows-domain-----------msDS-UserAllowedToAuthenticateFrom:
> > O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.example://ext/AuthenticationSilo
> > != "winclient-silo"))-----------As you can see, it stays "XA" only
> > it changes from "==" to !=" and this is handled by the option
> > "deny" or "allow" in the condition.
> > Stefan
> > > Douglas
> > 
> > 
> > 
> 
> The problem is that SDDL has two separate representations: the
> encoded binary representation, and the SDDL string representation
> (like “O:SYG:SYD:…”. msDS-ComputerAllowedToAuthenticateTo uses the
> binary representation, and if you set it to an SDDL string instead,
> ndr_unpack() will be unable to decode it, as you see here.
> The recommended way to set the SDDL is like so:
> samba-tool domain auth policy modify --name win11 --computer-allowed-
> to-authenticate-to=SDDL
> Does Windows cope with an SDDL string in the msDS-
> ComputerAllowedToAuthenticateTo attribute?

Regarding setting SDDL, if using ldb tools to do it:
The Samba-side magic that allows LDB tools to show and set string-
format SDDL into ntSecurityDescriptor is controlled by samba/lib/ldb-
samba/ldif_handlers.c
This list could be extended.
Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
