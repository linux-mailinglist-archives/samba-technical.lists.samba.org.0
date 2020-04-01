Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F7B19ABE3
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 14:42:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=/RwBQjxCbSW6W6MegiWAKSP7aBrT3azzLxHK5V5BlCM=; b=zF8dUIRQMLS2/1DDZ1jXkzmnk4
	b3tbC20oQLFf+XHBat8J/iPtBVIIRaWoiCt92vrayyUZxU1b50rJMuaFMB4r+yeCbH4MBr+9+Uddu
	d5EZlGeODLiUc6q74SJ1SJv7qlGWsKxQzENydGg/2zmshAiDCjlkJlx5kJwPqcsCXHhQ+u3Wy1+Zz
	o11ET8Z6rnYxO6iQ5VnT8YOOj49+9fbwCTYBjVy/sLepkBXBjkT/rHrXctR3J21cM7VLHdeqCoI53
	Ng8cd7uuQD7/Z4ry/9+kx8Rt4wffd3nggBC6TrAaNNHmJZdyIGQn+fub+31ZiLqvmpmTSyBLURPa8
	eEArcQeg==;
Received: from localhost ([::1]:33270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJcgI-0030DB-Hy; Wed, 01 Apr 2020 12:41:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63018) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJcg9-0030Cm-VV; Wed, 01 Apr 2020 12:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=/RwBQjxCbSW6W6MegiWAKSP7aBrT3azzLxHK5V5BlCM=; b=28HmYMZHqO/PXzqmKQccqBDJ13
 FR0uPzarE/8NJSFqMLe0DhzFcjWoQqYUd6Osqug3X1EO7hKi+yElWC6r9MBzyI6QszzqxntWhJRl1
 xGDWT8n/kiXZam+o4O/afiK7bnL0M35b8kLgQ/AErmQKTs85QBumB+WrsW/v9IrvF9jieFW0iAhwa
 ZmtwU0y+m+5R5P3ZsaxP2oexxz8n1Zn2idgrmFrjyUnpm8LwwTiNXETEGwamlb4lTCZZWojhXQ3UB
 iH3Xu0iwZeXwzvYbz0Qc1eODIaeDQ0tBKGe9pEH4gn3gqqVnWLOdW5J68TndxzFuiyNheogLeeH/r
 TCxIwUnPQWtQE6IabXF6JtQmkKgGMoYvHKqboyHp87PIFmsYYENQ/K/mNG2DWHxXUQQwTfMhvkEmB
 oYQl29ha/j1rauz+lIuGbhQnytZRNcpHo+9JNMGkYqoR5bbzmD3kNkWRGxQpsz1oFe4kuVMLoyGR1
 EieJF7gVXlpL3H5NqKUYQIR2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jJcg7-0006rS-Kv; Wed, 01 Apr 2020 12:41:07 +0000
To: <samba@lists.samba.org>,
	<samba-technical@lists.samba.org>
References: <vmime.5e847907.224.1ceae53116cf3f7@ms249-lin-003.rotterdam.bazuin.nl>
 <4d56eb2f-575f-0009-982a-c3bd2573256a@samba.org>
In-Reply-To: <4d56eb2f-575f-0009-982a-c3bd2573256a@samba.org>
Subject: RE: [Samba] Missing domain user tickets with winbind
Date: Wed, 1 Apr 2020 14:41:07 +0200
Message-ID: <2EEA75FCB1C14A5797689961D4815BD4@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: AdYIItBBxnhgYJ98RLWTOwKtUH1t8g==
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I would say in addition to Alexander's comment  

And Alexander or Rowland anyone...  ;-)  correct me if im wrong.. These are
the days to learn guys. 
Make good use of you "@ home" time. 

Read on..  

Ssh works because it use the "default" of ubuntu and like Debian these just
work for kerberos.
If all resolving works as it should 
These also dont need SPN/UPN. Just plain kerberos auth is suffient. 
(* or use hostname@SPN but that i dont know ). 

The debian and ubuntu defaults for winbind "should" be sufficient. 
(run : pam-auto-update see if you have winbind as option )
But i dont know it that also works with selfcompiled packages, 
i think you need to make that pam-config file first. 
Which is :

/usr/share/pam-configs/winbind
Name: Winbind NT/Active Directory authentication
Default: yes
Priority: 192
Auth-Type: Primary
Auth:
        [success=end default=ignore]    pam_winbind.so krb5_auth
krb5_ccache_type=FILE cached_login try_first_pass
Auth-Initial:
        [success=end default=ignore]    pam_winbind.so krb5_auth
krb5_ccache_type=FILE cached_login
Account-Type: Primary
Account:
        [success=end new_authtok_reqd=done default=ignore]
pam_winbind.so
Password-Type: Primary
Password:
        [success=end default=ignore]    pam_winbind.so try_authtok
try_first_pass
Password-Initial:
        [success=end default=ignore]    pam_winbind.so
Session-Type: Additional
Session:
        optional                        pam_winbind.so

And 

Which is in /etc/pam.d/samba 
Pointing to /etc/pam.d/common-auth ( and the others -account -pasword
-session.. ) 
Containing : 

account [success=1 new_authtok_reqd=done default=ignore]
pam_winbind.so

auth    [success=1 default=ignore]      pam_winbind.so krb5_auth
krb5_ccache_type=FILE cached_login try_first_pass 

password        [success=1 default=ignore]      pam_winbind.so try_authtok
try_first_pass

session optional                        pam_winbind.so


It works the same for my NFSv4, kerberos automounted homedirs.
Basilcy, your "computer" needs to have the rights to do the automount for
the user. 
And then it "just works" .. 

With : 
root/hostname.fqdn@REALM

Or 
COMPUTER$/hostname.fqdn@REALM

Or
cifs/hostname.fqdn@REALM

(note, some need obligated uppercased SPN's, im not sure for cifs. ) 

And nfs
nfs/hostname.fqdn@REALM

There is a search order for above, but i lost the link where it shows it. 
Its in a manual somewhere. 

Now, then.. 
Add on the computer object allow delegation to the service (or all ) and
your almost done. 

Note: 
If your user homedirs are not accessable by user root ( what i have here ) 
You need to add : ignore_k5login = true in  krb5.conf 

And then i use this for the mount service. 
Change Type  to cifs and correct the 'where' and 'what'. 

Your smb.conf looks fine, no need to change anything there. 

Also, below is based on systemd and its services files because its just easy
to setup. 

! Note, 
if you mounting in to /home/user your service have MUST BE..
home-users.(auto)mount
It reflexs to the "where" path and is always PATH-FOLDER-SOMETHING.mount the
"Where" 

#home-users.mount
[Unit]
Description=users folder

[Mount]
What=server.domain.tld:/users
Where=/home/users
Type=nfs

#SloppyOptions=
#LazyUnmount=
#ForceUnmount=

# Default = 0755
# Directories of mount points (and any parent directories) are automatically
created if needed
# This option specifies the file system access mode used when creating these
directories
#DirectoryMode=

# Default = disable = 0
TimeoutSec=300

[Install]
WantedBy=multi-user.target

And file: 

# home-users.automount
[Unit]
Description=Automount Home-users

[Automount]
Where=/home/users

[Install]
WantedBy=multi-user.target

Above is well tested as it runs now about 3 years without problems. 
There where a few in debian wheezy and stretch but now with buster
 its a brease to make this work. 

Check what you have now for SPN/UPN's 
kinit Administrator
net ads setspn list $(hostname -s)
Should show:  
Registered SPNs for hostname
        HOST/hostname
        HOST/hostname.internal.dom.tld
        nfs/hostname.internal.dom.tld

Where i have nfs you should have cifs or add root that allows both, 
but also more so i preffer to set per SPN. 

On the samba client :  man net 
 search for keytab in it. 

Above has all info to make it work. 
If one has improvements, im all ears..  :-) 


Greetz, 

Louis







 

> -----Oorspronkelijk bericht-----
> Van: samba [mailto:samba-bounces@lists.samba.org] Namens 
> Rowland penny via samba
> Verzonden: woensdag 1 april 2020 13:59
> Aan: samba@lists.samba.org
> Onderwerp: Re: [Samba] Missing domain user tickets with winbind
> 
> On 01/04/2020 12:20, L.P.H. van Belle via samba wrote:
> > For that to work, you need to add the 
> CIFS/hostname.fqdn@REALM to the host your logging in.
> > The COMPUTER$ should hold it.
> > Allow the computer to delegate the cifs service.  ( or all )
> 
> Thing is, the OP is trying to use a users ticket to mount, 
> but seems to 
> be doing it as root, which isn't going to work, mainly because 'root' 
> will use the root ticket /tmp/krb5cc_0. He needs to use the users 
> ticket, typically /tmp/krb5cc_{user_id}
> 
> He is also setting a credentials file in his mount command, 
> this should 
> be removed. Also, are libnss-winbind, libpam-winbind and libpam-krb5 
> installed ?
> 
> I would also point him to your repo: http://apt.van-belle.nl/

Yeah, but he runs ubuntu 19.x i've not compiled these, im waiting for the
next LTS for that. 
And if its not to much work to make these python3.8 compliant. 

> 
> This would save him having to compile Samba himself.
> 
> Finally, I would suggest he installs libpam-mount, this will 
> do all the 
> heavy lifting for him.
> 
> Rowland
> 
> 
> >
> >
> >>
> >> =======================================================
> >> Details of my setup:
> >> I'm using an Ubuntu 19.10 server VM.
> >> I'm mounting as the local root user, however, I'm using a 
> domain user
> >> credentials for mounting the using sec=krb5.
> >> Below are my mount options:
> >> vers=3.0,sec=krb5,credentials=/home/localadmin/.smb3credential
> > 
> s,serverino,noperm,nosharesock,mfsymlinks,uid=lxsmbadmin,gid='doma> in
> 
> 
> -- 
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba
> 
> 


