Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D35041CBDAD
	for <lists+samba-technical@lfdr.de>; Sat,  9 May 2020 07:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=SckkOhq97L7+yQGsSz1F9nElGxCAXbNd7G8PTw9VsxE=; b=Mh5aibbCNc7Zd7RV95mewc993Y
	OH+ANM1Kz1/QwSQhEYBCXSYTSRlKfPqgHGc4Yt/3dzlzqZtKiKL2gTeMwxrcWW3arMNjdnCo7C//6
	lvADP12nFOsE2dmlV1yPq+dVbfjcJiTmrF0ztQjTpcY/yIyGbIj4yFUfLHubQxCdxBxuNJpkhwh4f
	VILSHe68cARElp4d0vTS9Ym+BPJUDIAC+ymISA1sgiIdCe62y+S3J3KwmTudiaXbYRgX0+/5lvvwi
	QKBnoIpnBT/o+OJhtfe0qQO8hxnWyJjnCklk7n4jLV1Vgi6C2lyhLX/+rM1OK+IF/WDPung0NGKFR
	tD3bsL+Q==;
Received: from localhost ([::1]:61442 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXHpr-003NN6-U0; Sat, 09 May 2020 05:15:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52220) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXHpb-003NMh-Gn; Sat, 09 May 2020 05:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=SckkOhq97L7+yQGsSz1F9nElGxCAXbNd7G8PTw9VsxE=; b=OmbmxpLfJMkVkJMijjh9o4S+ZF
 PNaRu4GTiQcJK0YXKPCwAYbWUUFgMAhfoWzMvmJBbyY1YHzizJWV4ghvDvhhnMYPur4joO8BNYRhF
 eDyvdZGNLvmleJXY4ZjL1uzbs2/CdlJ1CIMlknEvPuNqQ4UNjQ15dx3bObR8nJ5f4X/fEtHpC0K2r
 MvGPgsGVGALEQS8pdhos71+ocYkOhdgZcZg7UJqxrqOoEFAat8I9uF1HEmEdv/pWYoH1PMwLCbZHq
 p+r/8HgQ5dBG/4EVgyK5JCtH/kDe1jZA4n5ioqBic8X+m0OEN5s7OmDghDxhdkITe4YA+DMZbK4M9
 N0DVW+s52HBFtSqjGAtBC1Z/TWLp/wZN/ABUEaE8dJnL7MxHux1TVA7xRRKcwRvwxj+lg3oTVV71f
 mXCEEeOzacg5gbnf39hu+3J5yvBB1qAL32XvbUnPgGwiONcHi7vDr5GwWyf//cJ6If1bWR6AkAihJ
 mPPnoXctbISN/U8cK7JhEkRU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXHpZ-0004ia-Bq; Sat, 09 May 2020 05:15:22 +0000
Message-ID: <dc5aeb2762d8dd1153e1a4039a1125fc5340b276.camel@samba.org>
Subject: Re: [Samba] Win7 clients problem after upgrading samba file server
 to 4.12 on Arch
To: pavlos <pavlos.audiofreak@gmail.com>
Date: Sat, 09 May 2020 17:14:57 +1200
In-Reply-To: <CABTC9Xy=7O93QPBa4cy+ht2rv_q5k4uLfe3NJZxZt7MgEqw94Q@mail.gmail.com>
References: <CABTC9XwbzmfEUKu+RA2b+bRjLKzdXzWkZo7E2FhUX+fKMiXw=A@mail.gmail.com>
 <a4ea6ee9-1717-9c27-bfae-258cf1afbe06@samba.org>
 <CABTC9XyU_bFhj6-rCC=wGFHrtq+24sq6kqA1kW=B4ZOVHC2uyw@mail.gmail.com>
 <741f671f-d7ec-4fb0-1f08-dfde0bc0d2ad@samba.org>
 <CABTC9XxvL_2s_TpBtdvz2rsNrNsypC=BJb1cYdDq8vFLpOjtpQ@mail.gmail.com>
 <e502c62de797631ee8395d4bc9204b913a45f10d.camel@samba.org>
 <CABTC9Xy8NjY6k2FQOB9cWOjFN+ys1zm0jqxZDPnoPK52WfekOg@mail.gmail.com>
 <d9ec8706f92bdd6eb3aa9a727da957517f7429a5.camel@samba.org>
 <CABTC9XzV5pXCkximUB5P_+SQLetH_sr45oZjSm1HcWDy2QPrMA@mail.gmail.com>
 <01153dd1be46db8376a49f0d09237ae6763cad77.camel@samba.org>
 <CABTC9XzA0njuzR98jTD4T7U3Ntn7hLqvtMhvkcEYn41p+O0gMQ@mail.gmail.com>
 <CABTC9XyPbRLHJvkAhzPSqNdhD3Wk8xSbnSALQscqa_H0aguiwQ@mail.gmail.com>
 <CABTC9Xwz2Qd2c6mrp__j+MWpQOg6dH8peHSxYpAGx3NxE1cJ-A@mail.gmail.com>
 <ea5d5a254c3bb3692073fc396fb05cd55bea3f77.camel@samba.org>
 <CABTC9Xwk7AiAMn+y63AOcBVDWu6pi-q=XFMC+E=sf6h3uUs79A@mail.gmail.com>
 <4ea864117a088f3a799ab9b99094f543d86f2aac.camel@samba.org>
 <CABTC9Xxv-vyyFqfoeMS98YN7BGsf_4dBfXtVAHDxZLvRz99d_A@mail.gmail.com>
 <fd505ee92e4a87ca2da3981e969692a7612f382a.camel@samba.org>
 <CABTC9Xzb=BC__k8cHAs5SyxU4FmJ20KGACsB_0UNtRDrjuVkGA@mail.gmail.com>
 <cb748d0ac7e9af2a77476a75cb5cf859aae0dd65.camel@samba.org>
 <CABTC9XwTaExDKD8NBmJ4AxjN3=6nEmvWQwAiYAK_nhwPhC+vog@mail.gmail.com>
 <CABTC9Xw=+zgRZz10ipqmMLG233RPJ_-7G-Dvxx5cFR+XVc5DAQ@mail.gmail.com>
 <CABTC9Xy=7O93QPBa4cy+ht2rv_q5k4uLfe3NJZxZt7MgEqw94Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: sambalist <samba@lists.samba.org>, vl@samba.org,
 samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day Volker and Jermey,

Can you take a look at Pavlos's analysis and see if you can work out
why he has been having trouble with Samba since this commit?

Pavlos,

That is an incredible effort, and so very, very much appreciated!

Thanks,

Andrew Bartlett

On Sat, 2020-05-09 at 06:08 +0200, pavlos wrote:
> Hi All,
> 
> It's already 6am at my side. After the whole night of bisecting, compiling and testing I think I have nailed it:
> 
> > fd61e550acec6e9924a71712eef739b58c7d68e8 is the first bad commit
> > commit fd61e550acec6e9924a71712eef739b58c7d68e8
> > Author: Volker Lendecke <vl@samba.org>
> > Date:   Mon Sep 16 16:16:40 2019 -0700
> > 
> >     smbd: Don't always walk the share mode array in open_mode_check()
> > 
> >     share_mode_data->flags contains the "most restrictive" share mode of
> >     the whole array. This is maintained lazily: Whenever set_share_mode()
> >     is called, d->flags is updated if the new share mode got more
> >     restrictive. It is not updated when a file is closed, as this would
> >     mean we would have to walk the whole array, making sure that the
> >     closed handle was indeed the only most restrictive one. Instead, we
> >     walk the share mode array only when a conflict happens: Then we need
> >     to know "the truth" and recalculate it by walking the share mode
> >     array.
> > 
> >     Signed-off-by: Volker Lendecke <vl@samba.org>
> >     Reviewed-by: Jeremy Allison <jra@samba.org>
> > 
> >     Autobuild-User(master): Jeremy Allison <jra@samba.org>
> >     Autobuild-Date(master): Wed Sep 18 00:07:13 UTC 2019 on sn-devel-184
> > 
> >  source3/smbd/open.c | 217 ++++++++++++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 200 insertions(+), 17 deletions(-)
> 
> Why do I think so?
> Because: 
> I did a reset my current Samba master - my last clone was about 10 hours ago. 
> It is version 4.13.0pre1-GIT-e907f002a7f
> Then I have carefuly edited the file 'source3/smbd/open.c' and withdrawn all changes
> Saved, compiled, installed, started services, tested different scenarios and it works PROPERLY.
> For the first time in any version greater that 4.11
> Yes, it's magic :)
> 
> Please, be so kind and check - everybody who suffers this bug, and, of course, the author of this change - and let me know whether my night was worth spending in front of my computer.
> 
> Looking forward to hearing from you.
> Pawel.
> 
> ..
> 
> 
> śr., 6 maj 2020 o 00:06 pavlos <pavlos.audiofreak@gmail.com> napisał(a):
> > Andrew, please forget about mu dumb question.
> > Nice tutorial here: https://flaviocopes.com/git-bisect/
> > I know how to proceed and what is the 'git clean...' for.
> > 
> > Will come back :)
> > Pawel
> > 
> > wt., 5 maj 2020 o 23:43 pavlos <pavlos.audiofreak@gmail.com> napisał(a):
> > > 'git checkout' in your first sentence- please be more detailed. 
> > > And please remember where I start - I am just after 'git clone' and build of 4.13.x
> > > 
> > > Pawel
> > > 
> > > wt., 5 maj 2020 o 23:28 Andrew Bartlett <abartlet@samba.org> napisał(a):
> > > > On Tue, 2020-05-05 at 22:32 +0200, pavlos wrote:
> > > > > Hi Andrew et al,
> > > > > 
> > > > > Now is the time to come back to my leisure...
> > > > > 
> > > > > Preparing the environment to the 'git bisect' surgery:
> > > > > Got a clone of the last VM with 4.12.2 installed from 
> > > > > https://download.samba.org/pub/samba/samba-latest.tar.gz
> > > > > Stopped smb/nmb services and uninstalled 'sudo make uninstall' within
> > > > > the directory 4.12.2.
> > > > > Got the current master with 'git clone 
> > > > > https://gitlab.com/samba-team/samba/' - it's version is 4.13.0pre1.
> > > > > From inside the directory: './confugure', 'make' and 'sudo make
> > > > > install'. No issues.
> > > > > Started smb/nmb services. No issues, as all configuration was adapted
> > > > > to different directories layout and missing packages installed during
> > > > > previous attempt.
> > > > > # smbstatus --version
> > > > > Version 4.13.0pre1-GIT-f80c97cb8da
> > > > > Stubborn problems with multiple Win7 clients do persist,
> > > > > unfortunately.
> > > > > 
> > > > > Now we have to move backwards till the last commit when it was
> > > > > working properly. 
> > > > > We already know that 4.12.x is hopeless and we have to find last
> > > > > working commit within 4.11.x branch. 
> > > > > For instance, the 4.11.3 - the last provided by Arch packagers - was
> > > > > working. 
> > > > > But there were many other patches published by samba, the current one
> > > > > is 4.11.9.
> > > > > 
> > > > > Would it be possible to perform 'git bisect' between different
> > > > > branches?
> > > > 
> > > > Yes, it can do that, in the git checkout.  Because of the different
> > > > branches it will do an extra at the point they diverge.
> > > > 
> > > > > Please give me some instructions as I am new in this school :)
> > > > 
> > > > git bisect good samba-4.11.2
> > > > (say yes to starting the bisect)
> > > > git bisect bad samba-4.12.2
> > > > 
> > > > Then it will move to various points it needs to test, counting down the
> > > > bisect revisions.  
> > > > 
> > > > Between each one, do a 'git clean -x -f -d && ./configure && make -j &&
> > > > sudo make install'
> > > > 
> > > > Finally, first install ccache if you can, it will be much faster.
> > > > 
> > > > Andrew Bartlett
> > > > 
> > > > > Regards, Pawel.
> > > > > 
> > > > > wt., 5 maj 2020 o 11:50 Andrew Bartlett <abartlet@samba.org>
> > > > > napisał(a):
> > > > > > On Tue, 2020-05-05 at 11:08 +0200, pavlos wrote:
> > > > > > > My plans are as follows, step by step:
> > > > > > > - clone the VM, clean and build the newest from gitlab, I can see
> > > > > > it
> > > > > > > is 4.13.0pre1
> > > > > > > - clone the VM. clean and build the latest supported 4.11.8
> > > > > > > - create a new fresh VM with another distro, not Arch or Arch-
> > > > > > based,
> > > > > > > build the official 4.12.2 - to check/confirm that it is not
> > > > > > distro-
> > > > > > > related
> > > > > > 
> > > > > > Thanks.  Even if it is distro-related, the bisect between the two
> > > > > > versions will be helpful.
> > > > > > 
> > > > > > Andrew Bartlett
> > > > > > 
> > > > > > > I will start playing in couple of hours, now I am at work...
> > > > > > > 
> > > > > > > Pawel.
> > > > > > > 
> > > > > > > wt., 5 maj 2020 o 03:33 Andrew Bartlett <abartlet@samba.org>
> > > > > > > napisał(a):
> > > > > > > > On Tue, 2020-05-05 at 03:05 +0200, pavlos wrote:
> > > > > > > > > @Andrew
> > > > > > > > > Unfortunately I didn't make notes on exact time of errors
> > > > > > when
> > > > > > > > doing
> > > > > > > > > my tests...
> > > > > > > > > 
> > > > > > > > > But, I've spend last couple of hours on building samba from
> > > > > > > > master:
> > > > > > > > > Have made a clone of the virtual machine, with new name and
> > > > > > > > network
> > > > > > > > > interface mac address, and a new dynamic IP assigned by my
> > > > > > > > router.
> > > > > > > > > Uninstalled Arch packages: samba, smbclient and cifs-tools
> > > > > > > > (depending
> > > > > > > > > on smbclient)
> > > > > > > > > As 'ala' downloaded 
> > > > > > > > > https://download.samba.org/pub/samba/samba-latest.tar.gz and
> > > > > > > > unpacked
> > > > > > > > > it, obtaining 'samba-4.12.2' directory
> > > > > > > > 
> > > > > > > > Thanks.  This gives you Samba 4.12.2.  However our development
> > > > > > > > branch,
> > > > > > > > master is newer.  Could you try that?
> > > > > > > > 
> > > > > > > > git clone https://gitlab.com/samba-team/samba/
> > > > > > > > 
> > > > > > > > That can be downloaded from
> > > > > > > > 
> > > > > > 
> > > > https://gitlab.com/samba-team/samba/-/archive/master/samba-master.tar.bz2
> > > > > > > >  
> > > > > > > > but if you use git, then you can really help us with the
> > > > > > bisect.
> > > > > > > > 
> > > > > > > > But the rest of your steps look good.
> > > > > > > > 
> > > > > > > > The next step, assuming master still fails, is to do a bisect. 
> > > > > > > > http://webchick.net/node/99
> > > > > > > > 
> > > > > > > > You may need to run 'git clean -x -f -d' between steps.
> > > > > > > > 
> > > > > > > > This will be slow, particularly as you can't automate it (need
> > > > > > test
> > > > > > > > with the client), but it is a very good way to find what the
> > > > > > issue
> > > > > > > > is.
> > > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > 
> > > > > > > > Andrew Bartlett
> > > > > > > > 
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



